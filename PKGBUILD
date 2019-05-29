# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='kindd'
_pkgname='Kindd'
_pkggit='kindd-git'
pkgver=2.0.0
pkgrel=1
pkgdesc=" A Kindful dd gui written in qt quick"
conflicts=("${_pkggit}")
arch=('any')
url="https://github.com/LinArcX/Kindd"
license=('GPL-3.0')
depends=('polkit' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-graphicaleffects')
makedepends=('git' 'qt5-base')
source=("${pkgname}.tar.gz::https://github.com/LinArcX/Kindd/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  qmake CONFIG+=debug CONFIG+=qml_debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm755 ./kindd ${pkgdir}/usr/bin/kindd
  install -Dm644 ./appconf/kindd.desktop ${pkgdir}/usr/share/applications/kindd.desktop
  install -Dm644 ./appconf/kindd.svg ${pkgdir}/usr/share/pixmaps/kindd.svg
  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/kindd/LICENSE
}

