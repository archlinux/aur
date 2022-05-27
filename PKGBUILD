# Maintainer: Aaron Coach <aur at ezpz dot cz>
# Contributor: Alexandra Koch <alexandra@alexandrakoch.se>

pkgname=upliftpowerplay
_name=upp
pkgver=0.1.3
pkgrel=2
pkgdesc="UPP: A tool for parsing, dumping and modifying data in Radeon PowerPlay tables"
arch=('x86_64')
url="https://github.com/sibradzic/upp"
license=('GPL3')
depends=('python-click' 'python')
optdepends=('python-registry: reading "soft" PowerPlay table from Windows registry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('0ac9329d7e247229a2a3979197422498')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
