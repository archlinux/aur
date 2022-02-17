# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=pip_search
pkgname=python-pip_search
pkgrel=1
pkgver=0.0.10
pkgdesc="Searching thought pip when hard times strike."
url=https://github.com/victorgarric/pip_search
arch=('any')
depends=('python-pip')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/victorgarric/${_pkgbase}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('322e0f8c8695dbf0c07628cbc4c701cfed9575ccc4ecaa823f1d34aab4e65280')

build() {
	cd ${_pkgbase}-${pkgver}
	python setup.py build
}

package() {
	cd ${_pkgbase}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1
}
