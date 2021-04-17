# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.4.0
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
md5sums=('26d5a70e628e788977853db5d88d5c85')
sha256sums=('306b87a55713ab5a9a37a315cbf9ecd74a1c640287c23a7926e960626c522d04')
sha512sums=('619dd139fc542bb97a5dc72553e52a49a2181d3beb52ac62201503c36b8a8f2e28bd04984b1b4f6db55047f738eb2e6c1f63c3eb78192680904f589081298768')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
