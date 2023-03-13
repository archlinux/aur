# Maintainer: Emil Miler <em@0x45.cz>

pkgname=bch-control-tool
pkgver=1.2.1
pkgrel=2
pkgdesc='HARDWARIO Hub Control Tool'
arch=('any')
url='https://github.com/hardwario/bch-control-tool'
license=('MIT')
depends=('python-click>=6.0' 'python-click-log>=0.2.1' 'python-paho-mqtt>=1.0' 'python-pyaml>=3.11')
makedepends=('python-setuptools')
source=("https://github.com/hardwario/bch-control-tool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('61bb9e50f1f3072fc55be6724acfc59230c45e646359f0829216c443bfeda9ad')

package() {
	cd "$srcdir/bch-control-tool-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
