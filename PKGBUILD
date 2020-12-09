# Maintainer: Oleh Prypin <oleh@pryp.in>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Dan Serban
# Contributor: Fabio Volpe

_libname='pymunk'
pkgname='python-pymunk'
pkgver=6.0.0
pkgrel=1
pkgdesc="A wrapper around the 2d physics library Chipmunk"
arch=('x86_64')
url='http://www.pymunk.org/'
license=('MIT')
depends=('python' 'python-cffi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.zip")
sha256sums=('772a214f6ff87a1a856a881b92242ef4b2f5bedf08d0752f9eff73e045c35812')

build() {
	cd "$srcdir"/pymunk-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/pymunk-$pkgver
	python setup.py install -O1 --skip-build --root="$pkgdir"

	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
