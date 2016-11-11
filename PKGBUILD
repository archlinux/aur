# Maintainer: <kaptoxic _at_ yahoo _dot_ com >

pkgname="sifu"
pkgver=0.3.3
pkgrel=1
pkgdesc="Rapid software development tool made for creating cloud solutions."
url="https://codesifu.com"
arch=('i686' 'x86_64')
license=()
depends=('java-runtime')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://codesifu.com/download/sifu-0.3.3.tar.gz")
md5sums=('9c0937ce1c21f86369f35f2820fbc550')

package() {
  mkdir -p ${pkgdir}/usr/share/sifu
  mkdir -p ${pkgdir}/usr/bin
  
  cd ${srcdir}/${pkgname}-${pkgver}
  install -m 644 -D command-line.jar ${pkgdir}/usr/share/sifu/sifu.jar
  sed -i 's/command-line.jar/sifu.jar/g' sifu
  install -m 755 -D sifu ${pkgdir}/usr/bin/
}
