# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.4.8
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
md5sums=('97383bebe0b029a0a0d528c4e639f977')
sha256sums=('7ec4913adeed150e0981d598dd5aa49daa76abda7a1c3a1295aae6d7b0f42729')
sha512sums=('5d6b99a0f665cc8197286b909db49eeb7e9721a05b024c7670c6b514933ad63d31b93a9e315a8b9744b83898784b7eaa51db861890cbb971d86df10543d20a1f')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
