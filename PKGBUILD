# Maintainer: SoftExpert <softexpert at gmail dot com>

_releaseversion=23.04
_buildversion=0.1395
pkgrel=1

pkgname=klogg-continuous-bin
pkgver=23.04.r0.1395
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hyperscan' 'hicolor-icon-theme')
makedepends=('tar')

source=("${pkgname%-bin}-${_releaseversion}.${_buildversion}.deb::https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_releaseversion}.${_buildversion}-focal.deb")
b2sums=('cdf50d952db4b781d5bb62202385d9b18a5a6e11caad1471dc694d9b501d24da5d41c209a4cd10c8d0badec13cac17bbeaa0e8f6111f7ec1f4555ce350cf0c9c')

pkgver(){
  printf "%s.r%s" "${_releaseversion}" "${_buildversion}"
}

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
