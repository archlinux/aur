# Maintainer: nixi <nixi at cock dot li>

pkgname=bch-control-tool
pkgver=1.1.0
pkgrel=1
pkgdesc='HARDWARIO Hub Control Tool'
arch=('any')
url='https://github.com/hardwario/bch-control-tool'
license=('MIT')
depends=('python-click>=r6.0' 'python-click-log>=0.2.1' 'python-paho-mqtt>=1.0' 'python-pyaml>=3.11' 'python-simplejson>=3.6.0')
makedepends=('python-setuptools')
source=("https://github.com/hardwario/bch-control-tool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94eff3184bf6b3e5dd519702e6c064933856a6ddfe84666e46c3f12582546374')

package() {
	cd "$srcdir/bch-control-tool-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
