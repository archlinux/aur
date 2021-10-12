# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-yfinance
_name=${pkgname#python-}
pkgver=0.1.63
pkgrel=1
pkgdesc="Yahoo! Finance market data downloader (+faster Pandas Datareader)"
arch=('x86_64')
url="https://github.com/ranaroussi/yfinance"
license=('Apache')
depends=(
    'python-numpy'
    'python-pandas'
    'python-requests'
    'python-lxml'
    'python-multitasking'
)
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('11364fe94f1cf7811c45fc620acb61c8c45fcb88de317c7718bbdbc9c1573a4c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
