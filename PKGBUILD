# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=0.4.2
pkgrel=1
pkgdesc='A joystick-aware screen waker'
arch=('any')
url="https://github.com/foresto/joystickwake"
makedepends=('python-setuptools')
depends=('python' 'python-pyudev')
conflicts=('joystickwake-git')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(708bf42bafec18218f26065de29d0931b78c5d52a0716ff7fbb47b98b593fb54)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

