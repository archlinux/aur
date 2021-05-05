# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=etcd3gw
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=0.2.6
pkgrel=3
pkgdesc="A python client for etcd3 grpc-gateway v3 API"
arch=(any)
url="https://github.com/dims/etcd3-gateway"
license=(Apache)
depends=(
	python
	python-pbr
	python-urllib3
	python-requests
	python-six
	python-futurist
)
makedepends=(
	python
	python-setuptools
)
checkdepends=(
	python-pytest
	python-hacking
	python-coverage
	python-subunit
	python-sphinx
	python-oslosphinx
	python-oslotest
	python-testrepository
	python-testscenarios
	python-testtools
	python-pifpaf
	python-codecov
	python-nose
	python-pytest
	python-reno
	python-futurist
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('fe73f68a3c8f145706a1ef0d23106125')
sha256sums=('4a765a382ae18ebd4fccbc1388d1ac5226db0540bccd1f081052600df89145fd')
sha512sums=('054b9c843035b9029ffffd198dfffa7283eb6bf1a2c610d9e9c258f381191dac24ac88431773192a2dfc5637ac927bf8ee50abf4caca891535c7dbb86290323b')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

check(){
	cd $_pyname-$pkgver
	python -m pytest
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
