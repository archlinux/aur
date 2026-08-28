# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=scalastyle
pkgver=1.5.1
pkgrel=1
pkgdesc="Examines your Scala code and indicates potential problems with it."
arch=(any)
url="http://scalastyle.beautiful-scala.com/"
license=('Apache')
depends=('java-environment' 'bash')
provides=('scalastyle')
conflicts=('scalastyle')
_scalaver="2.13"

_jarname="${pkgname}_$_scalaver-$pkgver-assembly.jar"

source=("https://repo1.maven.org/maven2/com/beautiful-scala/${pkgname}_$_scalaver/$pkgver/$_jarname"
  "scalastyle.sh")

noextract=('$_jarname')

md5sums=('52f9ad273fc3ce5d98c161e7d2854e84'
  '6a149bd7949c1ed2043f676b6a35d6a1')

package() {
  install -Dm644 $srcdir/$_jarname $pkgdir/usr/share/java/scalastyle/$_jarname
  install -Dm755 $srcdir/scalastyle.sh $pkgdir/usr/bin/scalastyle
}
