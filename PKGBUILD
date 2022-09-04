# Maintainer: nixi <nixi at cock dot li>

pkgname=bch-firmware-tool
pkgver=1.8.3
pkgrel=1
pkgdesc='HARDWARIO Firmware Tool'
arch=('any')
url='https://github.com/hardwario/bch-firmware-tool'
license=('MIT')
depends=('python-appdirs>=1.4' 'python-pyserial>=3.5' 'python-colorama>=0.4' 'python-pyaml>=6.0' 'python-schema>=0.7' 'python-requests>=2.27' 'python-click>=8.0' 'python-intelhex>=2.2.1' 'python-pyftdi')
makedepends=('python-setuptools')
source=("https://github.com/hardwario/bch-firmware-tool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('14466add3be06f620ab9c54d52a314d65da9ea6ad019cb1b9b2dce8a12b637f5')

package() {
	cd "$srcdir/bch-firmware-tool-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
