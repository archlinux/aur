# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=preseq
pkgver=3.1.2
pkgrel=2
pkgdesc="A tool for predicting and estimating the complexity of a genomic sequencing library, equivalent to predicting and estimating the number of redundant reads from a given sequencing depth."
arch=('x86_64')
url="http://smithlabresearch.org/software/preseq/"
depends=('gsl' 'htslib')
makedepends=('make')
license=('GPL3')
source=("https://github.com/smithlabcode/preseq/releases/download/v${pkgver}/preseq-${pkgver}.tar.gz")
md5sums=('fca0d3e94ce2b557d3b2d6f374498bcc')

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

