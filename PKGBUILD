# Maintainer: Jonian Guveli <https://github.com/jonian/>

pkgname=gnome-shell-extension-flexi-dock
pkgver=1
pkgrel=1
pkgdesc="GNOME Shell extension to provide a flexible applications dock with panel mode support"
arch=("any")
url="https://github.com/hardpixel/flexi-dock"
license=("GPL")
depends=("gnome-shell")
conflicts=("gnome-shell-extension-flexi-dock-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/flexi-dock-v$pkgver.zip")
md5sums=('06ea5dc5b1e19a1db23fc4f343c07c94')

package() {
  rm -f "$srcdir/$pkgname-$pkgver.zip"
  rm -f "$srcdir/schemas/gschemas.compiled"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/flexi-dock@hardpixel.eu" \
    && cp -a "$srcdir/." "$_"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/flexi-dock@hardpixel.eu/schemas" "$_"
}
