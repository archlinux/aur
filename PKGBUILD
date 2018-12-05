# Maintainer: csicar

pkgname=openjml-bin
pkgver=0.8.40
pkgrel=2
pkgdesc="Java Software Verification Tool"
arch=(any)
url="https://www.openjml.org/"
license=('unknown')
depends=("java-runtime")
optdepends=("z3")
source=("http://jmlspecs.sourceforge.net/openjml.zip"
        "openjml.sh")
sha256sums=('e2f23ef1ba8a7661b7e248953c58a342adcf3e2554e04ed22351d6b02ad79f36'
            'ab8579e7d6b0b04542e1fd45c267eca55c9d26dfe2a43b0d8ece0e74eb819aca')

package() {
  install -m 755 -D "openjml.sh" "$pkgdir/usr/bin/openjml"

  mkdir -p "${pkgdir}/usr/share/java/openjml"

  cp openjml.jar "${pkgdir}/usr/share/java/openjml/openjml.jar"
  cp jmlspecs.jar "${pkgdir}/usr/share/java/openjml/jmlspecs.jar"
  cp jmlruntime.jar "${pkgdir}/usr/share/java/openjml/jmlruntime.jar"

}
