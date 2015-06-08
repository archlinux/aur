# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot com>

pkgname=istodo
pkgver=1.3.0
pkgrel=1
_refcommit=f4434216b659
pkgdesc="Crossplatform Qt5 based organizer for students"
arch=('i686' 'x86_64')
url="http://istodo.ru/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base')
makedepends=('desktop-file-utils')
source=("http://dev.istodo.ru/istodo-desktop/get/v${pkgver}.tar.gz")
install=${pkgname}.install
md5sums=('61dc7ec57c9429942eb1e1bbfbb31b0f')

build() {
  cd "${pkgname}-${pkgname}-desktop-${_refcommit}"
  qmake-qt5 PREFIX=/usr
  make sub-desktop
}

package() {
  cd "${pkgname}-${pkgname}-desktop-${_refcommit}"
  install -Dm755 "desktop/iStodo" "${pkgdir}/usr/bin/istodo"
  install -Dm644 "linux_deploy_1.0/source_amd64/icons/32x32/istodo.png" "${pkgdir}/usr/share/icons/hicolor/32x32/istodo.png"
  install -Dm644 "linux_deploy_1.0/source_amd64/icons/48x48/istodo.png" "${pkgdir}/usr/share/icons/hicolor/48x48/istodo.png"
  install -Dm644 "linux_deploy_1.0/source_amd64/icons/64x64/istodo.png" "${pkgdir}/usr/share/icons/hicolor/64x64/istodo.png"
  install -Dm644 "linux_deploy_1.0/source_amd64/icons/128x128/istodo.png" "${pkgdir}/usr/share/icons/hicolor/128x128/istodo.png"
  install -Dm644 "linux_deploy_1.0/source_amd64/icons/256x256/istodo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/istodo.png"
  install -Dm644 "linux_deploy_1.0/source_amd64/istodo.desktop" "${pkgdir}/usr/share/applications/istodo.desktop"
}
