# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=joystickwake
pkgver=0.4
pkgrel=1
pkgdesc='A joystick-aware screen waker'
arch=('any')
url="https://github.com/foresto/joystickwake"
makedepends=('python-setuptools')
depends=('python' 'python-pyudev')
conflicts=('joystickwake-git')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(390aa766b6694aeb6be1fd79e68213435c0cd01c0e72849f08b8ac07093dd968)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

