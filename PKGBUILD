# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-poetryup
_name=${pkgname#python-}
pkgver=0.5.4
pkgrel=1
pkgdesc="Updates dependencies and bumps their version in Poetry."
url="https://github.com/MousaZeidBaker/poetryup"
depends=('python')
makedepends=('python-setuptools')
optdepends=(
    'python-poetry'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('64f512cb03b252195597295c4210b9e0d5b4819b8fabcfa02454dae8401bf97d')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
