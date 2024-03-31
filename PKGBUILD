# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=python-numpysane
_name=${pkgname#python-}
pkgver=0.40
pkgrel=1
pkgdesc="More reasonable core functionality for numpy"
arch=('i686' 'x86_64')
url="https://github.com/dkogan/numpysane"
license=('LGPL3')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4053b2cbdb964e5a5a0e5d4a07e1d89967534ce929ca158ddf76b6b8a71932c1')

build() {
	cd $srcdir/$_name-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/$_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
