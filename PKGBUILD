# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pynrrd
pkgname=python-$_pkgname
pkgver=0.3.4
pkgrel=1
pkgdesc="Simple pure-python module for reading and writing nrrd files"
arch=('any')
url="https://github.com/mhe/pynrrd"
license=('MIT')
depends=('python-numpy')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/mhe/pynrrd/archive/v${pkgver}.tar.gz")
sha256sums=('b902ce452feca09c7d1cefb19b3b9c0ff44398a979c4afef2ec0bffd5193f0a9')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
