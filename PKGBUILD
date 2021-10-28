# Maintainer: Jonian Guveli <https://github.com/jonian/>
_uuid="bluetooth-quick-connect@bjarosze.gmail.com"
_repo="gnome-bluetooth-quick-connect"
pkgname=gnome-shell-extension-bluetooth-quick-connect
pkgver=26
pkgrel=1
pkgdesc="Allow to connect bluetooth paired devices from gnome control panel."
arch=("any")
url="https://github.com/bjarosze/$_repo"
license=("GPL")
depends=("gnome-shell" "bluez-utils")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f486a0d80185b57b934530162750bdf5')

package() {
  glib-compile-schemas "$srcdir/$_repo-$pkgver/schemas"

  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_repo-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
