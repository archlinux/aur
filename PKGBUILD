# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alexandra Koch <alexandra@alexandrakoch.se>
pkgname=python-registry
_name=$pkgname
pkgver=1.3.1
pkgrel=1
epoch=
pkgdesc="A pure Python library that provides read-only access to Windows NT Registry files."
arch=('any')
url="https://github.com/williballenthin/python-registry"
license=('Apache')
groups=()
depends=('python-unicodecsv' 'python')
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('8325d219f0f5c1721a9d4efd7997ceee')

build() {
	cd $srcdir/$_name-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/$_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

