# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname='python-fasttext'
pkgdesc="Library for fast text representation and classification – Python bindings"
url="https://github.com/facebookresearch/fastText"

provides=('python-fasttext')
conflicts=('python-fasttext')

pkgver=0.9.2
pkgrel=0

arch=('x86_64')
license=('BSD')

makedepends=('python-setuptools' 'python2-setuptools')
depends=('pybind11' 'python-future' 'python-numpy' 'python-scipy' 'python-pytorch')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz")
sha256sums=("7ea4edcdb64bfc6faaaec193ef181bdc108ee62bb6a04e48b2e80b639a99e27e")

build() {
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
