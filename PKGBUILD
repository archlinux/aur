# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=yfinance
pkgname=python-${_pkgname}
pkgver=0.1.55
pkgrel=2
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ranaroussi/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('714ea94be18346a5ee1e40e8e68292d3bbdcaeb8dcb26d8c0d1b5e2f8f749dc8')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
