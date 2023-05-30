# Maintainer: Jonian Guveli <https://github.com/jonian/>
_uuid="bluetooth-quick-connect@bjarosze.gmail.com"
_repo="gnome-bluetooth-quick-connect"
pkgname=gnome-shell-extension-bluetooth-quick-connect
pkgver=36
pkgrel=1
pkgdesc="Allow to connect bluetooth paired devices from gnome control panel."
arch=("any")
url="https://github.com/bjarosze/$_repo"
license=("GPL")
depends=("gnome-shell" "bluez-utils")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('76951133fa9d5632c6d6496be8427a0d')

package() {
  glib-compile-schemas "$srcdir/$_repo-$pkgver/schemas"

  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$_repo-$pkgver/." "$_/$_uuid"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && cp -a "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
