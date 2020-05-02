# Maintainer: csicar

pkgname=openjml-bin
pkgver=0.8.44
pkgrel=2
pkgdesc="Java Software Verification Tool"
arch=(any)
url="https://www.openjml.org/"
license=('unknown')
depends=("java-runtime")
optdepends=("z3")
source=("https://github.com/OpenJML/OpenJML/releases/download/0.8.44/openjml-0.8.44-20200413.zip"
        "openjml.sh")
sha256sums=('a0ca1867f4b8511fbbbff56968505d9c1120b59efbed6c9ef0eb9077fb763c7d'
            'ab8579e7d6b0b04542e1fd45c267eca55c9d26dfe2a43b0d8ece0e74eb819aca')

package() {
  install -m 755 -D "openjml.sh" "$pkgdir/usr/bin/openjml"

  mkdir -p "${pkgdir}/usr/share/java/openjml"

  cp openjml.jar "${pkgdir}/usr/share/java/openjml/openjml.jar"
  cp jmlspecs.jar "${pkgdir}/usr/share/java/openjml/jmlspecs.jar"
  cp jmlruntime.jar "${pkgdir}/usr/share/java/openjml/jmlruntime.jar"

}
