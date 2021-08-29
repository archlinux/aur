# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.4.4
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
md5sums=('52f126c76e57120d89b8d81a4eb42f97')
sha256sums=('16fcc82844913804b05f28481972b850580ff3103b48f36c021d3b99019f9e3f')
sha512sums=('5f17dd8434aba61636f20b36fe165769e1775f7dd1128ab59f1196a65d35197cece034d820fb48a5dcca5181f4290cfd9afe1c2f360333241951450364036276')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
