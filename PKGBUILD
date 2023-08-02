# Maintainer: Stefan Gehr <stefan@gehr.xyz>

_name=sty
pkgname=python-${_name}
pkgver=1.0.4
pkgrel=1
pkgdesc="String styling for your terminal"
arch=(any)
url="https://sty.mewo.dev/"
license=(Apache)
depends=(python)
makedepends=(python-setuptools python-toml)
source=($pkgname-$pkgver.tar.gz::"https://github.com/feluxe/sty/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("7b2d74cf0b669c94916e33be79e30eb8e7679bbeecad3edc6a230b1c66011d800ea58b2a0aa8bc31a603815cd77f1befb392a6627f2f19ccf939135570cd61c2")

build() {
	cd $_name-$pkgver
	python setup.py build
}

package(){
	cd $_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
