# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-dark-variant
pkgver=2
pkgrel=1
pkgdesc="Gnome Shell extension to apply dark window decorations"
arch=("any")
url="https://github.com/hardpixel/dark-variant"
license=("GPL")
depends=("gnome-shell" "xorg-xprop")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("5bc7c151dc346da467f70c873907da22")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/dark-variant-$pkgver/dark-variant@hardpixel.eu" "$_"
  install -d "$pkgdir/usr/share/glib-2.0" && mv "$pkgdir/usr/share/gnome-shell/extensions/dark-variant@hardpixel.eu/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
