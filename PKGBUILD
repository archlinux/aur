# Maintainer: Chair050 <tmiggia at proton dot me>
# Contributor: qlonik <volodin.n at gmail dot com>

pkgname=python-readlike
pkgver=0.1.3
pkgrel=1
pkgdesc="GNU Readline-like line editing module"
url="http://jangler.info/code/readlike"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/r/readlike/readlike-$pkgver.tar.gz")
md5sums=('95fe69ddd0f17ba88e63419bb4310ea1')

build() {
	cd $srcdir/readlike-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/readlike-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
