# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.3.5
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
md5sums=('75225b2d94fa8cad9139db890e3e078c')
sha256sums=('02e3377dfb6f0ae152209cc2f92ca20fbdd75764a9ffef3662bf4682e9fe559e')
sha512sums=('1af9525b41a3bc472b24a5352e7a824b6243d9a190b2ff7698d6ecd43d5975df6d526f985c8014f2c6c85f711ac301c816d4e002ecb93661aee7d1e857152ba3')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
