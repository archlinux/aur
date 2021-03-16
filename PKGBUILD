# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=sphinxcontrib-actdiag
pkgname=python-$_pyname
pkgver=2.0.0
pkgrel=1
pkgdesc="Sphinx actdiag extension"
arch=('any')
url="https://github.com/blockdiag/sphinxcontrib-actdiag"
license=(BSD)
depends=(
	python
	actdiag
	blockdiag
	python-sphinx
)
makedepends=(
	python
	python-setuptools
)
source=("https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('ec3d18e7dc33c1cce23406cc6d3a61be')
sha256sums=('4edb8564e2e48a0e0c50b2e7743425ad34f1f11886c37e0cb23997a0f95a74c6')
sha512sums=('8faeb97b6be7c1a3603d34d34331ed4144a0b4a1ea537d8826682252213268a288f180ee0218d1266e199c41eba5e85caabf0a0f734024c358019fe806dd38de')

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
