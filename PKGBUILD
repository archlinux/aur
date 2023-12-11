# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=python-onigurumacffi
pkgver=1.3.0
pkgrel=1
pkgdesc="Python cffi bindings for the oniguruma regex engine"
arch=('x86_64')
url="https://github.com/asottile/onigurumacffi"
license=('MIT')
depends=('oniguruma' 'python-cffi')
makedepends=('python-setuptools')
_pkgname=${pkgname#python-}
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('bf126a4663976389699f7a7de8dc3a05782a960484e11f674e24a3acfe0caa9a')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

