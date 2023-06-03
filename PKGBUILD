# Maintainer: SoftExpert <softexpert at gmail dot com>

_releaseversion=23.06
_buildversion=0.1400
pkgrel=1

pkgname=klogg-continuous-bin
pkgver=23.06.r0.1400
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
b2sums=('5bfd1448218270d8f93380dbbda61c22dcf40a6ee86a727e86d2c849bc24783d470a2efabe735aa5c62c424d8373b1e6fb399f53710d12d6a190405e7e70c92b')

pkgver(){
  printf "%s.r%s" "${_releaseversion}" "${_buildversion}"
}

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
