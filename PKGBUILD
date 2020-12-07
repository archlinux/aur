# Maintainer: Thibault Boyeux <thibault.boyeux@gmail.com>

pkgname=python-ycast
_pkgname=YCast
pkgver=1.1.0
pkgrel=1
pkgdesc="A self hosted replacement for the vTuner internet radio service"
arch=(any)
url="https://github.com/milaq/YCast"
license=('GPL')
depends=('python' 'python-requests' 'python-flask' 'python-pyaml' 'python-pillow')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/milaq/YCast/archive/${pkgver}.tar.gz")
sha512sums=('905CD727758FB4BCE2538FDECFAC436B97CE4FFA7454B2C5512A83CEBFF4E5F0ED40D5C186C591A2102F6EC05BFC4A80FD84FF6347FD859774EAC227AFC6D514')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}