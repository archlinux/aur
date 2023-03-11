# Maintainer: Timothy Gu <timothygu99@gmail.com>

_pkgname=pynvml
pkgname=python-pynvml
pkgver=11.5.0
pkgrel=1
epoch=
pkgdesc="Python Bindings for the NVIDIA Management Library"
arch=('any')
url="https://pypi.org/project/pynvml/"
license=('BSD')
depends=('nvidia-utils' 'python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d027b21b95b1088b9fc278117f9f61b7c67f8e33a787e9f83f735f0f71ac32d0')

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --optimize=1 --prefix=/usr --root="$pkgdir" --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
