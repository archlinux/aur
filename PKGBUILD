# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python2-$_projectname"
pkgver='20200316'
_commit='a8ba87e25ccbea04b80806073d0714ea6c1a540c'
pkgrel='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork - python2 version'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python2' 'smartmontools')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('9c0112c36e363abc4ed2380e3e68ebefaa889da59606becb06d10f5b1e481799')

_sourcedirectory="$_reponame-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
