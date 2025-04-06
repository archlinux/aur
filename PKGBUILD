# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=python-onigurumacffi
pkgver=1.4.1
pkgrel=1
pkgdesc="Python cffi bindings for the oniguruma regex engine"
arch=('x86_64')
url="https://github.com/asottile/onigurumacffi"
license=('MIT')
depends=('oniguruma' 'python-cffi')
makedepends=('python-setuptools')
_pkgname=${pkgname#python-}
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8a642fe93a3c3fd2ad28baf506d3364bcae04e9cb93aa63c08ac4a4180007b0c')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

