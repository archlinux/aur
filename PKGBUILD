# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=wurlitzer
pkgname=python-$_pkgname
pkgver=1.0.1
pkgrel=1
pkgdesc="Capture C-level stdout/stderr in Python"
arch=('any')
url="https://github.com/minrk/wurlitzer"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/minrk/wurlitzer/archive/${pkgver}.tar.gz")
sha512sums=('782c30c2f5b9279d0b7a5f2076f89c8630f3171646df6b5f467dbb91bb64b0068d936e2544d252074df454f527b84788cac06430f6482aa97fcd42a28629bf7e')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
