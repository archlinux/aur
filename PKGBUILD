# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-mouser
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="Mouser Python API"
url="https://github.com/sparkmicro/mouser-api/"
depends=(
    'python'
    'python-click'
    'python-requests'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f2b09352b0ecbb3eb5f057ac39adcb619bd266b1f19143bf2c1b6686461abbb3')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
