# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-csnake
_name=${pkgname#python-}
pkgver=0.3.5
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
sha256sums=('e9f68aed10742b6f381109c6c420e0b1a8b53c49dcb69deb7404f570ea1b26f8')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
