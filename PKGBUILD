# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=genometools
pkgver=1.5.10
pkgrel=1
pkgdesc="A unified set of bioinformatics tools for analyzing genomes"
arch=('x86_64')
url="http://genometools.org/"
license=('ISC')
depends=()
makedepends=('gcc-libs')
checkdepends=('ruby')
provides=('genometools')
conflicts=('genometools')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2d2a5ad359d60094a5e941ed7319aa45')
MAKEFLAGS="-j$(nproc)"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install prefix="${pkgdir}/usr"
}
