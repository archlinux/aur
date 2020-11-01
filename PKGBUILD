# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=preseq
pkgver=3.1.1
pkgrel=1
pkgdesc="A tool for predicting and estimating the complexity of a genomic sequencing library, equivalent to predicting and estimating the number of redundant reads from a given sequencing depth."
arch=('x86_64')
url="http://smithlabresearch.org/software/preseq/"
depends=('gsl' 'htslib')
license=('GPLv3')
source=("https://github.com/smithlabcode/preseq/releases/download/v${pkgver}/preseq-${pkgver}.tar.gz")
md5sums=('3114e2875ac45995b88c5dcc15ddfc23')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}/usr/bin" --enable-hts
}

build() {
  cd "${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${pkgname}-${pkgver}"
  make install
}

