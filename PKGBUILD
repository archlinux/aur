# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-unite
pkgver=65
pkgrel=1
pkgdesc="Unite makes GNOME Shell look like Ubuntu Unity Shell"
arch=("any")
url="https://github.com/hardpixel/unite-shell"
license=("GPL")
depends=("gnome-shell" "xorg-xprop")
optdepends=("gnome-shell-extension-dash-to-dock")
provides=("gnome-shell-extension-unite")
conflicts=("gnome-shell-extension-unite-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('980de6c89e3ed95c785bb8c98cd2dfd6')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/unite-shell-$pkgver/unite@hardpixel.eu" "$_"

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/unite@hardpixel.eu/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
