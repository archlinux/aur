# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=ascii-image-converter-git
pkgver=1.7.1
pkgrel=2
pkgdesc="A cross-platform command-line tool to convert images into ascii art and print them on the console."
arch=('any')
url="https://github.com/TheZoraiz/ascii-image-converter"
license=('custom:ApacheV2')
# I'm not sure if it depends on any other libraries, I think Go takes care of it
makedepends=('go')
provides=('ascii-image-converter')
conflicts=('ascii-image-converter')
source=("git+https://github.com/TheZoraiz/ascii-image-converter.git")
md5sums=('SKIP')

build() {
  cd "ascii-image-converter"
  go build
}
package() {
  cd "ascii-image-converter"
  install -Dm 755 ./ascii-image-converter -t "$pkgdir/usr/bin/"
  install -Dm 644 ./LICENSE.txt -t "$pkgdir/usr/share/licenses/ascii-image-converter/"
}
