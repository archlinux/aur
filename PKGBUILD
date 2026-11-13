pkgname=ibus-areca-bin
_pkgname=ibus-areca
pkgver=0.1.3
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
sha256sums=('41a7bb8746278178a30ff28a8565f12cfb1277d54d1508ff077672e5a968f40e')
options=(!debug !strip)

package() {
  bsdtar -xf "$srcdir/$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' \
    --exclude='.MTREE' --exclude='.INSTALL'
}
