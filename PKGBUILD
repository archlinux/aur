# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-csnake
_name=${pkgname#python-}
pkgver=0.3.4
pkgrel=1
pkgdesc="C code generation helper package."
url="https://gitlab.com/andrejr/csnake"
depends=('python')
makedepends=('python-setuptools')
optdepends=(
    'python-numpy'
    'python-scipy'
    'python-pillow'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('64b4cce88dfa370797ca815fc399354a62fec5bea2e1c07b2f721c1ea066a7bc')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
