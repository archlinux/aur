# Maintainer: Ordoe ordoe <aur@cach.co>

pkgname=python-sense-hat
pkgver=2.1.0
pkgrel=2
pkgdesc="Raspberry Pi Sense HAT Python library"
arch=('armv7h')
url="https://pythonhosted.org/sense-hat/"
license=('BSD')
depends=('python' 'python-pillow' 'python-setuptools' 'python-numpy' 'python-rtimulib' 'i2c-tools' 'lm_sensors') 
provides=('python-sense-hat')
source=("https://github.com/RPi-Distro/python-sense-hat/archive/v${pkgver}.tar.gz")
sha256sums=('fdc26c296955b7b7cca9279e4cbe309b835afbd4912e0b46cbeac20051ff84e5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  
  # Install license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENCE.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
