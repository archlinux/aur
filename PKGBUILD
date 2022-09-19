# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=avro
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=1.11.1
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
md5sums=('b6177d3d2b1646cb331745837af72ed0')
sha256sums=('f123623ecc648d0e20ce14f8ed85162140c13cc4b108865d1b2529fbfa06c008')
sha512sums=('4e2158fd060642b3820fff7969b3122a89c5258d8f7d6d6ef176b3b4ad123f87283c3b74c671bbcbb54843ee22ba6f2a3a6c986d4835bf509698d7bba33e6b31')

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
