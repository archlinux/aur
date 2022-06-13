# Maintainer: Florian Latifi <mail@florian-latifi.at>
pkgname=gnome-shell-extension-stocks-extension
pkgver=24
pkgrel=1
pkgdesc="An extension to display stock quotes in GNOME Shell Panel"
arch=("any")
url="https://github.com/cinatic/stocks-extension"
license=("GPL")
provides=("gnome-shell-extension-stocks-extension")
depends=("gnome-shell")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("7c1044caeb8dd3bd0d209065dd06dce289c27d6738f2cc3e2ecc132a9d1cd08e")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/stocks-extension-$pkgver/stocks@infinicode.de" "$_"
  install -d "$pkgdir/usr/share/glib-2.0" && mv "$pkgdir/usr/share/gnome-shell/extensions/stocks@infinicode.de/schemas" "$_"

  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
