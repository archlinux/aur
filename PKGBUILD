# Maintainer: lautis <lautis at gmail dot com>

pkgname=python-hifiberrydsp
pkgver=0.21
pkgrel=1
pkgdesc="Software for HiFiBerry boards equipped with DSP."
url="https://github.com/hifiberry/hifiberry-dsp"
license=(MIT)
arch=(any)
depends=(python python-rpi-gpio libxml2 zlib python-lxml libxslt  python-spidev python-requests python-xmltodict python-pyalsaaudio)
makedepends=(python-setuptools)
source=("https://github.com/hifiberry/hifiberry-dsp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3c8a6c1cb278a314155d74966de89c96e9ad3a8cb89317722a653e547762fce')

package() {
	cd $srcdir/hifiberry-dsp-$pkgver
	python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd ../..
	install -Dm644 sigmatcp.service "${pkgdir}/usr/lib/systemd/system/sigmatcp.service"
}
