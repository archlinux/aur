# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.4.5
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
md5sums=('2879187d191f6a9b9952e4295892693c')
sha256sums=('fb5b4b46bd9f89be07921752bac952daa872a79f94fadf01f3679da906824424')
sha512sums=('22c31daa9dff10fb582c2fbff48a5c3205e9fd22e24783c1b4771f937aa21e3b3fa74c73be97199176ebc86088db717cb7233096c6d7f42a871fa038de542108')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
