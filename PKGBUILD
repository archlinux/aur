# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=pext
_pkgname=Pext
pkgver=0.19
pkgrel=1
pkgdesc='Python-based extendable tool'
url='https://pext.io/'
arch=(any)
license=(GPL3)
depends=(python-dulwich python-pynput python-pip python-pyqt5 qt5-quickcontrols)
makedepends=(python-setuptools)
optdepends=('pass: password manager support'
            'ffmpeg: radiobrowser music support'
            'python-opengl: required for correct rendering on some GPUs')
provides=(pext)
conflicts=(pext)
source=("https://github.com/Pext/Pext/archive/v$pkgver.tar.gz")
sha256sums=('b4561f3745761a2895b5bc060004676f891ba6b5ce6ed8c7f88557cbe74bd7ee')

prepare() {
  sed "s/USE_INTERNAL_UPDATER = .*/USE_INTERNAL_UPDATER = False/" -i ${srcdir}/${_pkgname}-${pkgver}/pext/constants.py
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
