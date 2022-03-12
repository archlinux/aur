# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=pip_search
pkgname=python-pip_search
pkgrel=1
pkgver=0.0.11
pkgdesc="Searching thought pip when hard times strike."
url=https://github.com/victorgarric/pip_search
arch=('any')
depends=('python-pip' 'python-rich' 'python-bs4')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/victorgarric/${_pkgbase}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('aad2e71aac70bea6dd2022773c67bb37a6374c8e109c214ef19dea05227b7028')

build() {
	cd ${_pkgbase}-${pkgver}
	python setup.py build
}

package() {
	cd ${_pkgbase}-${pkgver}
	python setup.py install --root="$pkgdir/" --optimize=1
}
