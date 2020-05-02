# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pynrrd
pkgname=python-$_pkgname
pkgver=0.4.2
pkgrel=1
pkgdesc="Simple pure-python module for reading and writing nrrd files"
arch=('any')
url="https://github.com/mhe/pynrrd"
license=('MIT')
depends=('python-numpy')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/mhe/pynrrd/archive/v${pkgver}.tar.gz")
sha256sums=('0e0c60c9927adb31d97a7e3d00756dec987f115b2857dec0d6e4641490acfbd6')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 "${srcdir}/$_pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
