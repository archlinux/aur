# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>
_projectname='fasteners'
pkgname="python2-$_projectname"
pkgver='0.15'
pkgrel='3'
pkgdesc='A python package that provides useful locks - python2 version'
arch=('any')
url="https://github.com/harlowja/$_projectname"
license=('Apache')
depends=('python2' 'python2-monotonic>=0.1' 'python2-six')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f77e2f9a2e3fb3d1570c8542ebbe437239a66f6edf141a8677c6002075abc01c')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
