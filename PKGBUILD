# Maintainer: SoftExpert <softexpert at gmail dot com>

_releaseversion=23.06
_buildversion=0.1405
pkgrel=1

pkgname=klogg-continuous-bin
pkgver=23.06.r0.1405
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hyperscan' 'hicolor-icon-theme')
makedepends=('tar')

# inspect https://api.github.com/repos/variar/klogg/releases

source=("${pkgname%-bin}-${_releaseversion}.${_buildversion}.deb::https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_releaseversion}.${_buildversion}-focal.deb")
b2sums=('ab0266d436a34c27b0acfefb0cfa9f42121e45cc98ff31f01ee59012d78318adf757a271167790686ace61d9652e590dba746b07b2f8a591f87a721e6a91c3f5')

pkgver(){
  printf "%s.r%s" "${_releaseversion}" "${_buildversion}"
}

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
