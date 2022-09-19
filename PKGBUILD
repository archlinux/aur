# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.6.1
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
md5sums=('4bb0d2da1c5234976bbb31158ee20a75')
sha256sums=('bc37a6edbde7a04a9df28ab838b94df7527e5eea648d61633233abba59205146')
sha512sums=('1cb381c069682b60dfa14536924bea485a109b3fced6929f27bbc5f5d87e71fb943a0edabac1e38b92aea3dc46e9de9fad4ae3a68d19d32a1f6dcd73204ecd2c')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
