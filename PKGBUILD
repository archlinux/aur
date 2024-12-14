# Maintainer: Rhys Perry <rhysperry111 AT gmail.com>

pkgname=python-rpi-ws281x
_name=rpi_ws281x
pkgver=4.3.4
pkgrel=1
pkgdesc="Userspace Raspberry Pi PWM/PCM/SPI library for SK6812 and WS281X LEDs."
arch=('any')
url='https://github.com/rpi-ws281x/rpi-ws281x-python/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('072eff1787e579d1710381b27c467709e3aab28ac579c7a47d7cc87398496f28')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
