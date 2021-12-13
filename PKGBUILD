# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-yfinance
_name=${pkgname#python-}
pkgver=0.1.67
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
source=("${_name}-${pkgver}.tar.gz::https://github.com/ranaroussi/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9912451c9d4c3c3ec3451b0e1bd529b22a3d4e52bb6c89a35a971387fb3271b3')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
