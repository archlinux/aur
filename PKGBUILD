# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-dash-to-plank
pkgver=18
pkgrel=1
pkgdesc="GNOME Shell extension to integrate Plank, the simplest dock on the planet."
arch=("any")
url="https://github.com/hardpixel/dash-to-plank"
license=("GPL")
depends=("gnome-shell" "plank")
provides=("gnome-shell-extension-dash-to-plank")
conflicts=("gnome-shell-extension-dash-to-plank-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/dash-to-plank-v$pkgver.zip")
md5sums=('66504fa0838c79e39c8d5d0ec87e049f')

package() {
  rm -f "$srcdir/$pkgname-$pkgver.zip"
  rm -f "$srcdir/schemas/gschemas.compiled"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/dash-to-plank@hardpixel.eu" \
    && cp -a "$srcdir/." "$_"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/dash-to-plank@hardpixel.eu/schemas" "$_"
}
