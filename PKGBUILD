# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=fastavro
pkgname=python-$_pyname
pkgver=1.3.3
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
md5sums=('345bfc8fbd3ae12c835a78fb22f076fd')
sha256sums=('1d9b18a86ecc3837a919c3190f2f538b7bcf179e0ad2524d7626699773bf2945')
sha512sums=('0c60674a622829927ad8bd1d87f2e4d86391c0329412f5efcb66482941117cbb781c619425a172964a836c477418c26fb00720934a9e0cd338c8da845170bca3')

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
