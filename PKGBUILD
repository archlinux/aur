# Maintainer: Ordoe ordoe <aur@cach.co>

pkgname=python-sense-hat
pkgver=2.2.0
pkgrel=3
pkgdesc="Raspberry Pi Sense HAT Python library"
arch=('armv7h' 'armv6h')
url="https://pythonhosted.org/sense-hat/"
license=('BSD')
depends=('python' 'python-pillow' 'python-setuptools' 'python-numpy' 'python-rtimulib' 'i2c-tools' 'lm_sensors')
provides=('python-sense-hat')
source=("https://github.com/RPi-Distro/python-sense-hat/archive/v${pkgver}.tar.gz")
sha256sums=('8c9780acb89942c2838fd8406e7e7f7836a8d8fb5debad74c0e9dd83e93a8a48')

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
