# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.4.1
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/fastavro/fastavro"
license=(MIT)
depends=(
	python
	python-snappy
	python-zstandard
	python-lz4
)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('e2274f748e2b92ee95e8bbcb3bf446a7')
sha256sums=('237a741668316a2aadb14ba0532666a305dd14b4043aace89bcb0c6419c08162')
sha512sums=('150482a1bac71c2bea9b8e69957025b628030571fdc929f385eec6fdc8194a4cc5f7d3177cb3fceaab4311a26ee5caeb6d39e35e596b7a1b502a568b6b692bec')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
