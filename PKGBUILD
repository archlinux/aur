# Maintainer: Timothy Gu <timothygu99@gmail.com>

_pkgname=pynvml
pkgname=python-pynvml
pkgver=11.4.1
pkgrel=1
epoch=
pkgdesc="Python Bindings for the NVIDIA Management Library"
arch=('any')
url="https://pypi.org/project/pynvml/"
license=('BSD')
depends=('nvidia-utils' 'python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b2e4a33b80569d093b513f5804db0c7f40cfc86f15a013ae7a8e99c5e175d5dd')

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
