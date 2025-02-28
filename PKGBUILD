# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-hotel-manager
pkgver=24
pkgrel=1
pkgdesc="Gnome Shell extension to manage Hotel development servers"
arch=("any")
url="https://github.com/hardpixel/hotel-manager"
license=("GPL")
depends=("gnome-shell")
provides=("gnome-shell-extension-hotel-manager")
conflicts=("gnome-shell-extension-hotel-manager-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/hotel-manager-v$pkgver.zip")
md5sums=('9d8879d39fdd5a95240bbf02decb50a8')

package() {
  rm -f "$srcdir/$pkgname-$pkgver.zip"
  rm -f "$srcdir/schemas/gschemas.compiled"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/hotel-manager@hardpixel.eu" \
    && cp -a "$srcdir/." "$_"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/hotel-manager@hardpixel.eu/schemas" "$_"
}
