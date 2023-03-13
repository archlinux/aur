# Maintainer: Emil Miler <em@0x45.cz>

pkgname=bch-gateway
pkgver=1.17.0
pkgrel=2
pkgdesc='Hub Service for HARDWARIO USB Gateway'
arch=('any')
url='https://github.com/hardwario/bch-gateway'
license=('MIT')
depends=('python-click>=6.0' 'python-click-log>=0.2.1' 'python-paho-mqtt>=1.0' 'python-pyserial>=3.0' 'python-pyaml>=3.11' 'python-simplejson>=3.6.0' 'python-schema>=0.6' 'python-appdirs>=1.0')
makedepends=('python-setuptools')
source=("https://github.com/hardwario/bch-gateway/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6499619ce911d1a32c4269476256a754afe2fa05bd278dc4e43819235e958d96')

package() {
	cd "$srcdir/bch-gateway-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
