# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc="light-weight library to do shell-script like things relatively easily with Python"
arch=('any')
depends=(
	'python-braceexpand'
	'python-inform'
)
makedepends=(
	'python-setuptools'
	'python-wheel'
	'python-pip'
)
url="https://github.com/KenKundert/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('3d060a9e570886dada3515a886a2b4dff1dc12461684a164c337ac3bdf6c4d34fd89e48db7eb1479d55336677d798817971a825bf6f988f4fc7e93ae11f42d8b')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
