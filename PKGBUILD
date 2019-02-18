# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Giampaolo Mancini <giampaolo@trampolineup.com>

pkgname=python-gpiozero
pkgver=1.5.0
pkgrel=1
pkgdesc='A simple interface to GPIO devices with Raspberry Pi'
arch=('any')
url="https://github.com/RPi-Distro/${pkgname}"
license=('BSD')
optdepends=(
    'python-spidev: for SPI access'
    'python-rpi.gpio: for Raspberry Pi GPIO pin access via RPi.GPIO library'
)
depends=('python-colorzero' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RPi-Distro/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('179a773e838a3f091d8585f919ab7e702abb777d7d7a7e6df1bf48cae53083a0')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
