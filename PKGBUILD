#Maintainer: dreieck
#Contributor: Joerg Schuck
#Contributor: Wenzhi Liang
pkgname=jago
pkgver=6.2
pkgrel=2
pkgdesc="a SGF viewer + an IGS client + GMP client"
url="http://jagoclient.sourceforge.net/"
arch=('any')
license=('GPL2')
depends=(
  "java-environment"
  "desktop-file-utils"
)
source=(
  "http://jagoclient.sourceforge.net/jago.jar"
  "jago.sh::http://ix.io/1UeH"
  "jago.png" 
  "jago.desktop"
)
noextract=(jago.jar)
options=(!strip)
install=jago.install

sha256sums=('6200ffa1ba04b323046c7fb87d293c6f686c10795d3a02f733213cf10c99d4c7'
            '75187d608f84582d65becbe35579c0655d918d2660fe424b972acfed8ed12572'
            'd62858c2397d84d4d76baf751b45940d845a619a67b3798b07b9149a8a106329'
            '0ea0635e53a3b86177889719db1257ee34f44ea946a8bc013973afe6bc51491f')

package() {
  cd "${srcdir}"
  install -D -m644 jago.jar "${pkgdir}/usr/share/java/jago/jago.jar"
  install -D -m644 jago.png "${pkgdir}/usr/share/pixmaps/jago.png"
  install -D -m644 jago.desktop "${pkgdir}/usr/share/applications/jago.desktop"
  install -D -m755 jago.sh "${pkgdir}/usr/bin/jago"
}
