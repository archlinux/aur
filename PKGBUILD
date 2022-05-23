# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=python-numpysane
_name=${pkgname#python-}
pkgver=0.35
pkgrel=0
pkgdesc="More reasonable core functionality for numpy"
arch=('i686' 'x86_64')
url="https://github.com/dkogan/numpysane"
license=('LGPL3')
groups=('')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=('')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('1d7aef04459ab492b6e5fa1aec64f2a5')

build() {
	cd $srcdir/$_name-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/$_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
