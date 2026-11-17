pkgname=ibus-areca-bin
_pkgname=ibus-areca
pkgver=0.1.11
pkgrel=1
pkgdesc='Areca Vietnamese input method for IBus using the Bamboo engine'
arch=('x86_64')
url='https://github.com/xhkzeroone/ibus-areca'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=(
  'ibus'
  'glib2'
  'libxkbcommon'
  'gtk4'
  'python'
  'python-gobject'
  'gdk-pixbuf2'
  'libinput'
  'libei'
  'libportal'
  'systemd-libs'
  'dbus'
  'libx11'
  'libxtst'
)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
noextract=("$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('a0f6bf69824caee8266a521266883ddbff99c245c73b0051f03e3add1548a85a')
options=(!debug !strip)

package() {
  bsdtar -xf "$srcdir/$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' \
    --exclude='.MTREE' --exclude='.INSTALL'
}
