# Maintainer: nixi <nixi at cock dot li>

pkgname=bch-firmware-tool
pkgver=1.7.0
pkgrel=1
pkgdesc='HARDWARIO Firmware Tool'
arch=('any')
url='https://github.com/hardwario/bch-firmware-tool'
license=('MIT')
depends=('python-appdirs>=1.4' 'python-pyserial>=3.5' 'python-colorama>=0.3' 'python-pyaml>=5.1' 'python-schema>=0.6.8' 'python-requests>=2.21' 'python-click>=7.0' 'python-intelhex>=2.2.1' 'libftdi')
makedepends=('python-setuptools')
source=("https://github.com/hardwario/bch-firmware-tool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab7562bd40197c8f05bd54f2d48c064128091881c43bbc4898e655555377c8c4')

package() {
	cd "$srcdir/bch-firmware-tool-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
