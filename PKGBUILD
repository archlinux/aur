# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

_pkgbase=scalastyle
_scalaver="2.12"
pkgname="$_pkgbase-$_scalaver"
pkgver=1.5.1
pkgrel=1
pkgdesc="Examines your Scala code and indicates potential problems with it. (For Scala 2.12)"
arch=(any)
url="http://www.scalastyle.org/"
license=('Apache')
depends=('java-environment' 'bash')
provides=('scalastyle')
conflicts=('scalastyle')

_jarname="${_pkgbase}_$_scalaver-$pkgver-assembly.jar"

source=("https://repo1.maven.org/maven2/com/beautiful-scala/${_pkgbase}_$_scalaver/$pkgver/$_jarname"
  "scalastyle.sh")

noextract=('$_jarname')

md5sums=('1284cc5ff68465fe4c88185bc0c4ff64'
  '5a81d7de6ef3bf090a2e6f97d2a96c18')

package() {
  install -Dm644 $srcdir/$_jarname $pkgdir/usr/share/java/scalastyle/$_jarname
  install -Dm755 $srcdir/scalastyle.sh $pkgdir/usr/bin/scalastyle
}
