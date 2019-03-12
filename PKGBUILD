# Maintainer: peippo <christoph.fink@gmail.com>

pkgname='fasttext'
pkgdesc="Library for fast text representation and classification"
url="https://github.com/facebookresearch/fastText"

pkgver=0.2.0
pkgrel=0

arch=('any')
license=('BSD')

makedepends=('python-setuptools' 'python2-setuptools')
depends=('python-numpy' 'python-scipy')

source=("https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz")
sha256sums=('71d24ffec9fcc4364554ecac2b3308d834178c903d16d090aa6be9ea6b8e480c')

build() {
    cd "${srcdir}/fastText-${pkgver}"
    make
}

package() {
    install -Dm0755 "${srcdir}/fastText-${pkgver}/fasttext" "${pkgdir}/usr/bin/fasttext"
}
