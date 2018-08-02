# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Giampaolo Mancini <giampaolo@trampolineup.com>

pkgname=python-gpiozero
pkgver=1.4.1
pkgrel=1
pkgdesc='A simple interface to GPIO devices with Raspberry Pi'
arch=('any')
url="https://github.com/RPi-Distro/${pkgname}"
license=('BSD')
optdepends=(
    'python-spidev: for SPI access'
    'python-rpi.gpio: for Raspberry Pi GPIO pin access via RPi.GPIO library'
)
depends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RPi-Distro/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d2d7ef04487ac5271c0ff565877ce7a5c376fc05d01bff183c98aa00635af099')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
