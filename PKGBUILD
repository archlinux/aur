# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alexandra Koch <alexandra@alexandrakoch.se>
pkgname=upliftpowerplay
_name=upp
pkgver=0.0.7
pkgrel=1
epoch=
pkgdesc="UPP: A tool for parsing, dumping and modifying data in Radeon PowerPlay tables"
arch=('x86_64')
url="https://github.com/sibradzic/upp"
license=('GPL3')
groups=()
depends=('python-click' 'python-registry' 'python')
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('8be1f2ef8ae727082718f9ac3a0f5fb8')

build() {
	cd $srcdir/$_name-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/$_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

