# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='20200311'
_commit='7b065fa7d36558d96e9fa3c311db35c6af306cfa'
pkgrel='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork - python version'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python' 'smartmontools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('495d6158d2b3015965e81eafce3cb6cd6231bbc91971a46f669e32157d16a4c5')

_sourcedirectory="$_reponame-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
