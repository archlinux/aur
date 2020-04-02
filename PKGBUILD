# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=actiona
pkgver=3.10.1
pkgrel=1
pkgdesc='A task automation tool that allows you to create and execute action lists'
arch=('x86_64')
url='https://wiki.actiona.tools'
license=('GPL3')
depends=('qt5-script' 'qt5-xmlpatterns' 'qt5-x11extras' 'qt5-multimedia' 'libnotify' 'qt5-speech')
makedepends=('qt5-tools' 'boost' 'opencv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jmgr/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('447065e380f8f37db4c8af01df8e1b9d7189cd256205f758845b71d8de6f37ea')

build() {
  cd "${pkgname}-${pkgver}"

  qmake-qt5 -r PREFIX=/usr PKGCONFIG_OPENCV=opencv4
  make
  make locale_release
}

package() {
  cd "${pkgname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
}
