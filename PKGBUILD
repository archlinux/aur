# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-schematics
_name=${pkgname#python-}
pkgver=2.1.1
pkgrel=2
pkgdesc="Python Data Structures for Humans"
url="https://github.com/schematics/schematics"
depends=('python')
makedepends=('python-setuptools' 'python-pip')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('34c87f51a25063bb498ae1cc201891b134cfcb329baf9e9f4f3ae869b767560f')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
