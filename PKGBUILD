# Maintainer: SoftExpert <softexpert at gmail dot com>

_releaseversion=23.04
_buildversion=0.1344

pkgname=klogg-continuous-bin
pkgver=23.04.0.1344
pkgrel=1
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hyperscan' 'hicolor-icon-theme')
makedepends=('tar')
# https://github.com/variar/klogg/releases/download/continuous-linux/klogg-23.04.0.1344-focal.deb
source=("${pkgname%-bin}-${_releaseversion}.${_buildversion}.deb::https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_releaseversion}.${_buildversion}-focal.deb")
b2sums=('c64f46bb5c473bd55bd3c357c604ae6ffb4b1468bf13e299a6ea6689c6a61ef704171a024218593eb7425b0f61d0072e0210f09d796106f838dd013ed5269d19')

pkgver(){
  printf "%s.%s" "${_releaseversion}" "${_buildversion}"
}

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
