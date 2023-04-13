# Maintainer: Rich Lees <git0 at bitservices.io>
# Contributor: Aaron Coach <aur at ezpz dot cz>
# Contributor: Alexandra Koch <alexandra@alexandrakoch.se>

pkgname=upliftpowerplay
_name=upp
pkgver=0.1.7
pkgrel=2
pkgdesc="UPP: A tool for parsing, dumping and modifying data in Radeon PowerPlay tables"
arch=('x86_64')
url="https://github.com/sibradzic/upp"
license=('GPL3')
depends=('python' 'python-click' 'python-setuptools')
optdepends=('python-registry: reading "soft" PowerPlay table from Windows registry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('c0b42f7f9d331fd654352a06e142d474')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
