# Maintainer: Florian Latifi <mail@florian-latifi.at>
pkgname=gnome-shell-extension-stocks-extension
pkgver=25
pkgrel=1
pkgdesc="An extension to display stock quotes in GNOME Shell Panel"
arch=("any")
url="https://github.com/cinatic/stocks-extension"
license=("GPL")
provides=("gnome-shell-extension-stocks-extension")
depends=("gnome-shell")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("02d28c222e7a295f3fa5e8ff78bdac422b9e903365fcc55ee993d20642fea929")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/stocks-extension-$pkgver/stocks@infinicode.de" "$_"
  install -d "$pkgdir/usr/share/glib-2.0" && mv "$pkgdir/usr/share/gnome-shell/extensions/stocks@infinicode.de/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
