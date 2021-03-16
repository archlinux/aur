# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=oslosphinx
pkgname=python-$_pyname
pkgver=4.18.0
pkgrel=1
pkgdesc="OpenStack Sphinx Extensions and Theme"
arch=(any)
url="https://opendev.org/openstack/ldappool"
license=(Apache)
depends=(
	python
	python-pbr
	python-requests
	python-six
)
makedepends=(python-setuptools)
checkdepends=(
	python-hacking
	python-sphinx
	python-openstackdocstheme
	python-reno
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('f2e63063eeae74ca0f92452d964b9b5c')
sha256sums=('b3fcd7ecc8efdb80096b9a757e76300a97485e8e7899e86d953fff7d0a0aa4f6')
sha512sums=('b736dbf68a3ad8c32ca6d8de72cb79e49ab4b84593c70d0165615de66a8c343ce7094656d3b0be3383453143308a4862f27529b1c9d72920c5418a3f62dbcc46')

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
