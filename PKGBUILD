# Maintainer: zhullyb <zhullyb@outlook.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

_pyname=cursive
pkgname=python-$_pyname
pkgver=0.2.2
pkgrel=1
pkgdesc="Cursive implements OpenStack-specific validation of digital signatures."
arch=(any)
url="https://opendev.org/x/cursive"
license=(Apache)
depends=(
	python
	python-pbr
	python-cryptography
	python-oslo-serialization
	python-oslo-utils
	python-oslo-i18n
	python-oslo-log
	python-castellan
)
checkdepends=(
	python-hacking
	python-coverage
	python-subunit
	python-mock
	python-sphinx
	python-openstackdocstheme
	python-oslotest
	python-testrepository
	python-testscenarios
	python-testtools
	python-reno
)
makedepends=(
	python
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)

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
md5sums=('0450c7e9c591a8e97719f62b84d4a938')
sha256sums=('fbdc2b088bf0b9a69b1897d726e6027e8fba8f21f0a881344f70e7a407d9abda')
sha512sums=('6c97f8f71b016ee57349b8156543c8ca41c29c3f234ea60967b96c09fce2cea4b36b9f92996c622bd9504d4a71893903e8d5a8ab50e089fd37bddb8095f4b9d2')
