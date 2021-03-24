# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.3.4
pkgrel=1
pkgdesc="Fast read/write of AVRO files"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/fastavro/fastavro"
license=(MIT)
makedepends=(
	python
	python-snappy
	python-zstandard
	python-lz4
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('aa3f88f42985cbbfaccdd332e7345ebb')
sha256sums=('4c0c2ed0c218d3e8737bd04d6cac2a3c1afd11090d3ac3a45fbaafd73cfe2cd7')
sha512sums=('ec0d7b7b497855412cdeff4d089675697a9c8153e2d866a0db4c4e34695b027feac2ff520e891f29555815b1bb8a791adf9566b8c3b6929c9bd9305b2c49398a')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

_package_python(){
	depends=(
		python
		python-snappy
		python-zstandard
		python-lz4
	)
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

eval "package_python-${_pyname}(){ _package_python; }"
