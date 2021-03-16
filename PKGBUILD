# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=openstackdocstheme
pkgname=python-$_pyname
pkgver=2.2.7
pkgrel=1
pkgdesc="OpenStack Docs Theme"
arch=(any)
url="https://docs.openstack.org/openstackdocstheme/latest/"
license=(Apache)
depends=(
	python
	python-pbr
	python-dulwich
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-sphinx
	python-pre-commit
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('ae3515ee8f0d46e60df950aa558b387b')
sha256sums=('beacfc00277337c733c1e48ace1cdeb598faf5718609b638972d72fe04bf6372')
sha512sums=('38ca434d48c04608a66d05a93a19d030bf9302f024d052f67af21e241365f046e9508359dfb62cd1b8897836f20a4983cdeb3c1a66ca4e3161fd722da6006332')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
