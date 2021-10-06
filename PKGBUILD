# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=0.2.5
pkgrel=1
pkgdesc='A joystick-aware screen waker'
arch=('any')
url="https://github.com/foresto/joystickwake"
makedepends=('python-setuptools')
depends=('python' 'python-pyudev')
conflicts=('joystickwake-git')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c2f0357d0c9de10b3d3293cfba91c1d6d606eb3f1bc5be5aad780f08b0d40746')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

