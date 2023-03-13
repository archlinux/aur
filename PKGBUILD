# Maintainer: Emil Miler <em@0x45.cz>

pkgname=bch-firmware-tool
pkgver=1.9.0
pkgrel=2
pkgdesc='HARDWARIO Firmware Tool'
arch=('any')
url='https://github.com/hardwario/bch-firmware-tool'
license=('MIT')
depends=('python-appdirs>=1.4' 'python-pyserial>=3.5' 'python-colorama>=0.4' 'python-pyaml>=6.0' 'python-schema>=0.7' 'python-requests>=2.27' 'python-click>=8.0' 'python-intelhex>=2.2.1' 'python-pyftdi')
makedepends=('python-setuptools')
source=("https://github.com/hardwario/bch-firmware-tool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d069752f09213869e8509f3d6075c472265cb89876c7842457c3bdf8c13f763')

package() {
	cd "$srcdir/bch-firmware-tool-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
