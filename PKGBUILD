# Maintainer: peippo <christoph.fink@gmail.com>

pkgname='fasttext'
pkgdesc="Library for fast text representation and classification"
url="https://github.com/facebookresearch/fastText"

pkgver=0.1.0
pkgrel=0

arch=('any')
license=('BSD')

makedepends=('python-setuptools' 'python2-setuptools')
depends=('python-numpy' 'python-scipy')

source=("https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz")
sha256sums=('d6b4932b18d2c8b3d50905028671aadcd212b7aa31cbc6dd6cac66db2eff1397')

build() {
    cd "${srcdir}/fastText-${pkgver}"
    make
}

package() {
    install -Dm0755 "${srcdir}/fastText-${pkgver}/fasttext" "${pkgdir}/usr/bin/fasttext"
}
