# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-hotel-manager
pkgver=26
pkgrel=1
pkgdesc="Gnome Shell extension to manage Hotel development servers"
arch=("any")
url="https://github.com/hardpixel/hotel-manager"
license=("GPL")
depends=("gnome-shell")
provides=("gnome-shell-extension-hotel-manager")
conflicts=("gnome-shell-extension-hotel-manager-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/hotel-manager-v$pkgver.zip")
md5sums=('2a4e4949d1408010fca94ceb945d2c95')

package() {
  rm -f "$srcdir/$pkgname-$pkgver.zip"
  rm -f "$srcdir/schemas/gschemas.compiled"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/hotel-manager@hardpixel.eu" \
    && cp -a "$srcdir/." "$_"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/hotel-manager@hardpixel.eu/schemas" "$_"
}
