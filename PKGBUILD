# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=klogg-bin
pkgver=20.12
_subversion=0.813
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.${_subversion}.deb::https://github.com/variar/klogg/releases/download/v${pkgver}/klogg-${pkgver}.${_subversion}-Linux.deb")
sha256sums=('ee09b4a1ce3e1244e766690cdaaa6fd050ba4a2e52185b1e60834554713b4b83')

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
