# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=preseq
pkgver=3.2.0
pkgrel=1
pkgdesc="A tool for predicting and estimating the complexity of a genomic sequencing library, equivalent to predicting and estimating the number of redundant reads from a given sequencing depth."
arch=('x86_64')
url="http://smithlabresearch.org/software/preseq/"
depends=('gsl' 'htslib')
makedepends=('make')
license=('GPL3')
source=("https://github.com/smithlabcode/preseq/releases/download/v${pkgver}/preseq-${pkgver}.tar.gz")
md5sums=('293486920e3f6fcdab2418b8413f9cbd')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}/usr" --enable-hts
}

build() {
  cd "${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${pkgname}-${pkgver}"
  make install
}

