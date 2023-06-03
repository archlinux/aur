# Maintainer: SoftExpert <softexpert at gmail dot com>

_releaseversion=23.04
_buildversion=0.1397
pkgrel=1

pkgname=klogg-continuous-bin
pkgver=23.04.r0.1397
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg')
depends=('qt5-base' 'hyperscan' 'hicolor-icon-theme')
makedepends=('tar')

source=("${pkgname%-bin}-${_releaseversion}.${_buildversion}.deb::https://github.com/variar/klogg/releases/download/continuous-linux/klogg-${_releaseversion}.${_buildversion}-focal.deb")
b2sums=('d34fd26e76f7018fe3a49fe2e3552a5ffee3f32c3ec7eacaad34f5a4524c2e224ec15b29a0408ca4dfa9505ea93cf354b96fc2b8fc24c130a36154ab1cc280f9')

pkgver(){
  printf "%s.r%s" "${_releaseversion}" "${_buildversion}"
}

package() {
  tar xvf data.tar.gz -C "${pkgdir}/"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
