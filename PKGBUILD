# Maintainer: Frederick Price <fprice at pricemail dot ca>
# Contributor: Anton Filimonov <anton dot filimonov at gmail dot com>

pkgname=klogg-bin
pkgver=22.06
_subversion=0.1289
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.${_subversion}.deb::https://github.com/variar/klogg/releases/download/v${pkgver}/klogg-${pkgver}.${_subversion}-Linux-amd64-focal.deb")
sha256sums=('78d4b19d0bd631b0d7a54a099200970f4613815caf889345340cfecaea71d8d4')

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
