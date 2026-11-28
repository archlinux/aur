pkgname=ibus-areca-bin
_pkgname=ibus-areca
pkgver=0.1.21
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
)
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
noextract=("$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('4e260d547a2ddd5f833548cc05a9caac22e051c57b38838f8c6e4f99e0309f31')
options=(!debug !strip)

package() {
  bsdtar -xf "$srcdir/$_pkgname-$pkgver-$pkgrel-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude='.PKGINFO' --exclude='.BUILDINFO' \
    --exclude='.MTREE' --exclude='.INSTALL'
}
