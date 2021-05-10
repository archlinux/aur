# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='20210503'
_commit='e67fcdce079bf42b1268b69dbd4ffb30d8dc455e'
pkgrel='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork - python version'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python' 'smartmontools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('574574ebf7497098eadd2f8fbb9b8eeac86b25e145559a40ec3efdd1bfd76933')

_sourcedirectory="$_reponame-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
