# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=0.3
pkgrel=1
pkgdesc='A joystick-aware screen waker'
arch=('any')
url="https://github.com/foresto/joystickwake"
makedepends=('python-setuptools')
depends=('python' 'python-pyudev')
conflicts=('joystickwake-git')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(1b15e7f5a62a6df78af52fbbd707747ca45326da65a5e3c394d06b90acb77e91)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

