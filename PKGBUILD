# Maintainer: gcarq <michael.egger@tsn.at>

pkgname=souman
pkgver=1.0.1
pkgrel=1
pkgdesc="Utility to download and build packages from source using the Arch Build System (ABS)"
arch=('i686' 'x86_64')
url="https://github.com/gcarq/souman"
license=('GPL')
depends=('bash' 'abs')
source=(https://raw.githubusercontent.com/gcarq/souman/$pkgver/souman.sh)
sha256sums=('d950d973be0cfa6fdf288ad727fbb24431c1609e8d78d5520dafad9bc54a7ba1')

package() {
  install -D souman.sh "${pkgdir}/usr/bin/souman"
  # make version number adjustment to script
  sed -i "/VERSION=/s|%%VERSION%%|$pkgver|" "${pkgdir}/usr/bin/souman"
}
