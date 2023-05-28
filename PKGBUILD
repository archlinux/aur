# Maintainer: SoftExpert <softexpert at gmail dot com>

_releaseversion=23.04
_buildversion=0.1380
pkgrel=1

pkgname=klogg-continuous-bin
pkgver=23.04.r0.1380
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hyperscan' 'hicolor-icon-theme')
makedepends=('tar')

source=("${pkgname%-bin}-${_releaseversion}.${_buildversion}.deb::https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_releaseversion}.${_buildversion}-focal.deb")
b2sums=('f62853ee404cb9f8eb55556b81dd3fb51bc0520c869efe51a28fef59fa5f60da18a771ac8f5cc39cf43938b0c94a2304f512acb0a9f649baecf86b60aafefc72')

pkgver(){
  printf "%s.r%s" "${_releaseversion}" "${_buildversion}"
}

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
