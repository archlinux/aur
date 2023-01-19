# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=pip_search
pkgname=python-pip-search
pkgrel=2
pkgver=0.0.12
license=("MIT")
pkgdesc="Searching thought pip when hard times strike."
license=("MIT")
url=https://github.com/victorgarric/pip_search
replace=('python-pip_search')
arch=('any')
depends=('python-rich' 'python-beautifulsoup4' 'python-requests')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('89c78c36b4907ceb8e6b6313dc8759bf9dce80fbf5ee5f1d57445ea5c5a820d7')

build() {
	cd ${_pkgbase}-${pkgver}
	python setup.py build
}

package() {
	cd ${_pkgbase}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1
}
