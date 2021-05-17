# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='20210517'
_commit='2a96e1f24d06bba3a5ebe3dfe42dd11d471699c6'
pkgrel='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork - python version'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python' 'smartmontools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('1bd9d9c939e6bee07a1705c91da861029dcb68ecbfd63a6c1bea1db60988a410')

_sourcedirectory="$_reponame-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
