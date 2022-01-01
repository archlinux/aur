# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=avro
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=1.11.0
pkgrel=1
pkgdesc="Avro is a serialization and RPC framework."
arch=(any)
url="https://avro.apache.org/"
license=(Apache)
depends=(python)
makedepends=(
	python
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('cc43d76e5918cb2495b648d2dec30f60')
sha256sums=('1206365cc30ad561493f735329857dd078533459cee4e928aec2505f341ce445')
sha512sums=('e5fa1842df8d1dd730da850957927049c39788ce27b8454960d88fe7e8cf6bb6537e6db2dedd630fd09c03bc736f276b567c35c749f06fdc76a6d9cac43a4c07')

build(){
	pushd $_pyname-$pkgver
	python setup.py build
	popd
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 avro/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
