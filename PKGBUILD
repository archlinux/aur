# Maintainer: Yishen Miao <mys721tx@gmail.com>
# Contributor: Ordoe ordoe <aur@cach.co>

pkgname=python-sense-hat
pkgver=2.6.0
pkgrel=1
pkgdesc="Raspberry Pi Sense HAT Python library"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://pythonhosted.org/sense-hat/"
license=('BSD')
depends=('python' 'python-pillow' 'python-setuptools' 'python-numpy' 'python-rtimulib' 'i2c-tools' 'lm_sensors')
provides=('python-sense-hat')
source=("https://github.com/astro-pi/python-sense-hat/archive/v${pkgver}.tar.gz")
sha256sums=('fdde8c189f09c623f20f0e725a151abe6792516686e2154fe028afd305f8218a')

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
