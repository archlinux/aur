# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='20210628'
_commit='30d69c24650a15868f8d22a3a0e8068fcbbba9b8'
pkgrel='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork - python version'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python' 'smartmontools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('1adc225d72c20ed1c78622ab76db6b1966ecf5479dfdf606500eb250045373f5')

_sourcedirectory="$_reponame-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
