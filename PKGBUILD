# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=0.2.4
pkgrel=1
pkgdesc='A joystick-aware screen waker'
arch=('any')
url="https://github.com/foresto/joystickwake"
makedepends=('python-setuptools')
depends=('python' 'python-pyudev')
conflicts=('joystickwake-git')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ac9dc689797eafef7a214fd6cbe50b9e68270239363e377a43c504ce709fd34f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkname}"
}

