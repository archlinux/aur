# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pynrrd
pkgname=python-$_pkgname
pkgver=0.4.1
pkgrel=1
pkgdesc="Simple pure-python module for reading and writing nrrd files"
arch=('any')
url="https://github.com/mhe/pynrrd"
license=('MIT')
depends=('python-numpy')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/mhe/pynrrd/archive/v${pkgver}.tar.gz")
sha256sums=('ed48e7c5117063cc0e7e79ef6036c7a84f805e3fc1107fb7ef21c3cb70c5164f')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 "${srcdir}/$_pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
