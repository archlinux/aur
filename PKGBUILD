# Maintainer: peippo <christoph.fink@gmail.com>

pkgname='fasttext'
pkgdesc="Library for fast text representation and classification"
url="https://github.com/facebookresearch/fastText"

pkgver=0.9.1
pkgrel=0

arch=('any')
license=('BSD')

makedepends=('python-setuptools' 'python2-setuptools')
depends=('python-numpy' 'python-scipy')

source=("https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz")
sha256sums=("254ace2fc8dc3bea0fc6ad4897a221eb85c1e9adfa61d130b43398193ca1f061")

build() {
    cd "${srcdir}/fastText-${pkgver}"
    make
}

package() {
    install -Dm0755 "${srcdir}/fastText-${pkgver}/fasttext" "${pkgdir}/usr/bin/fasttext"
}
