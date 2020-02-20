# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python2-$_projectname"
pkgver='20200121'
_commit='d85e26697dbaf77b99e3028056824fcc9e745594'
pkgrel='2'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork - python2 version'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('9a4a97981727d038c4bbece76786be49472ff0fec9d44928d0c277b990d718b2')

_sourcedirectory="$_reponame-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
