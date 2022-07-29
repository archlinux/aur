# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=pip_search
pkgname=python-pip-search
pkgrel=1
pkgver=0.0.12
pkgdesc="Searching thought pip when hard times strike."
url=https://github.com/victorgarric/pip_search
conflicts=('python-pip_search')
arch=('any')
depends=('python-rich' 'python-beautifulsoup4' 'python-requests')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/victorgarric/${_pkgbase}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('89c78c36b4907ceb8e6b6313dc8759bf9dce80fbf5ee5f1d57445ea5c5a820d7')

build() {
	cd ${_pkgbase}-${pkgver}
	python setup.py build
}

package() {
	cd ${_pkgbase}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1
}
