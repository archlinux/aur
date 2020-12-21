# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=klogg-bin
pkgver=20.12
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/variar/klogg/releases/download/v${pkgver}/klogg-${pkgver}.0.810-Linux.deb")
sha256sums=('31bc0eca61e9c5e9a022fe1ee490086eb5abb83def746e0624aea8638f12c64c')

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
