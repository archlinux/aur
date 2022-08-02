# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-shlib'
_pkgname=${pkgname#python-}
pkgver=1.4
pkgrel=3
epoch=1
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

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        "$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc"
)
validpgpkeys=('4A47DE443CEE6D70A892347A9B8FFF1D3E1C0A50')

b2sums=('ea1dda23368e9d35e902fc75e85e26e85609d9a6d2d0827e547f37325d24571f7276792b833e82b57a41111bd89ca1099eb5b22e07f1d3d922b084ae1a44c085'
        'SKIP')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
