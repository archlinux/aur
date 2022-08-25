# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=python-onigurumacffi
pkgver=1.2.0
pkgrel=1
pkgdesc="Python cffi bindings for the oniguruma regex engine"
arch=('x86_64')
url="https://github.com/asottile/onigurumacffi"
license=('MIT')
depends=('oniguruma' 'python-cffi')
makedepends=('python-setuptools')
_pkgname=${pkgname#python-}
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('296fd0acd19bdb6af979ee02ed6795d9728f9a0845da91dc6cce7b9f2cf7ea8c')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

