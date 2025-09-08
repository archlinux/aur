# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-dash-to-plank
pkgver=20
pkgrel=1
pkgdesc="GNOME Shell extension to integrate Plank, the simplest dock on the planet."
arch=("any")
url="https://github.com/hardpixel/dash-to-plank"
license=("GPL")
depends=("gnome-shell" "plank")
provides=("gnome-shell-extension-dash-to-plank")
conflicts=("gnome-shell-extension-dash-to-plank-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/dash-to-plank-v$pkgver.zip")
md5sums=('4de738f9d100f0d2b135f27edef0e349')

package() {
  rm -f "$srcdir/$pkgname-$pkgver.zip"
  rm -f "$srcdir/schemas/gschemas.compiled"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/dash-to-plank@hardpixel.eu" \
    && cp -a "$srcdir/." "$_"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/dash-to-plank@hardpixel.eu/schemas" "$_"
}
