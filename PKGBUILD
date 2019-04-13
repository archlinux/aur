# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pynrrd
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple pure-python module for reading and writing nrrd files"
arch=('any')
url="https://github.com/mhe/pynrrd"
license=('MIT')
depends=('python-numpy')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/mhe/pynrrd/archive/v${pkgver}.tar.gz")
sha256sums=('6cd42e6a4417672011b8ca419276814f271a6acf261c4a2dbbc3627685cda7ce')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
