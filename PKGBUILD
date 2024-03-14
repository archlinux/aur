# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-unite
pkgver=78
pkgrel=1
pkgdesc="Unite makes GNOME Shell look like Ubuntu Unity Shell"
arch=("any")
url="https://github.com/hardpixel/unite-shell"
license=("GPL")
depends=("gnome-shell" "xorg-xprop")
optdepends=("gnome-shell-extension-dash-to-dock")
provides=("gnome-shell-extension-unite")
conflicts=("gnome-shell-extension-unite-git")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/unite-v$pkgver.zip")
md5sums=('7e3d2f96fc1e44afd646fd7aa299308e')

package() {
  rm -f "$srcdir/$pkgname-$pkgver.zip"
  rm -f "$srcdir/schemas/gschemas.compiled"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/unite@hardpixel.eu" \
    && cp -a "$srcdir/." "$_"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/unite@hardpixel.eu/schemas" "$_"
}
