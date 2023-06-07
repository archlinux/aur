# Maintainer: SoftExpert <softexpert at gmail dot com>

_releaseversion=23.06
_buildversion=0.1407
pkgrel=1

pkgname=klogg-continuous-bin
pkgver=23.06.r0.1407
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hyperscan' 'hicolor-icon-theme')
makedepends=('git' 'tar')

# inspect https://api.github.com/repos/variar/klogg/releases

source=("${pkgname%-bin}-${_releaseversion}.${_buildversion}.deb::https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_releaseversion}.${_buildversion}-focal.deb")
b2sums=('13d45a54e2341c990f30cf4b65da7ebe5e3817ebcadcd239a0067bf45038e1ab12092b12c969310387af9374ad54da621115a5df51692f37cce78b93d800ebb8')

pkgver(){
  printf "%s.r%s" "${_releaseversion}" "${_buildversion}"
}

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
