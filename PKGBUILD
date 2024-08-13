# Maintainer: Timothy Gu <timothygu99@gmail.com>

_pkgname=pynvml
pkgname=python-pynvml
pkgver=11.5.3
pkgrel=1
epoch=
pkgdesc="Python Bindings for the NVIDIA Management Library"
arch=('any')
url="https://pypi.org/project/pynvml/"
license=('BSD')
depends=('nvidia-utils' 'python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('183d223ae487e5f00402d8da06c68c978ef8a9295793ee75559839c6ade7b229')

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
