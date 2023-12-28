# Maintainer: Andrew Chen <andrew.chuanye.chen@gmail.com>

pkgbase='python-krpc'
_pyname='krpc'
pkgname=('python-krpc')
pkgver=0.5.3
pkgrel=1
pkgdesc="Client library for kRPC, a Remote Procedure Call server for Kerbal Space Program"
url="https://github.com/krpc/krpc"
license=("LGPL3")
arch=('any')
makedepends=('python' 'python-setuptools')
source=("https://github.com/krpc/krpc/releases/download/v$pkgver/krpc-python-$pkgver.zip")
b2sums=("467d328729e9978d0aa4b1d42ac2a2c68c584dd55e38f94d7151037fe06fb865e2dfdec5c90c287da06ecbcc546c017b5cd8c1a769c23b5f71c059ff3165b460")

build() {
	cd $_pyname-$pkgver
	python setup.py build
}

package() {
	cd $_pyname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
