# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=5.4.0
pkgrel=1
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/ggravlingen/pytradfri"
license=('MIT')
depends=('python' 'libcoap-dtls-git' 'python-dtlssocket')
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha512sums=('edb2a174d006bc780dea2dec8964452693a60f1df50bf5896b33d88957f6a33c6764398795a7d7e5c3b58073b33e98cac1ddc5fd407e97609b0a41bdb599e4af')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
