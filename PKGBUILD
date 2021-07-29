# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-schematics
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc="Python Data Structures for Humans"
url="https://github.com/schematics/schematics"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a40b20635c0e43d18d3aff76220f6cd95ea4decb3f37765e49529b17d81b0439')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
