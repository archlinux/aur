# Maintainer: Ordoe ordoe <aur@cach.co>

pkgname=python-rtimulib
_gitname=RTIMULib
pkgver=7.2.1
pkgrel=1
pkgdesc="Python Binding for RTIMULib, a versatile IMU library."
arch=('armv7h')
url="http://www.richards-tech.com/"
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=('gcc')
provides=('python-rtimulib')
source=("https://github.com/RPi-Distro/${_gitname}/archive/V${pkgver}.tar.gz")
sha256sums=('d8cc6c8c07633f4cd64f42fef80527033d3c8ed2a457fd6d003850450adb5b03')

build() {
  cd "${srcdir}/${_gitname}/Linux/python/"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}/Linux/python/"
  python setup.py install --root="${pkgdir}" --optimize=1
  
  # Install license
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
