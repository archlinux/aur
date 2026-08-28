# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

_pkgbase=scalastyle
_scalaver="2.11"
pkgname="$_pkgbase-$_scalaver"
pkgver=1.5.1
pkgrel=1
pkgdesc="Examines your Scala code and indicates potential problems with it. (For Scala 2.11)"
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

md5sums=('0e609a61319e9794eb496934085e02d5'
  'bec8256a252a5c565b28117a047a9674')

package() {
  install -Dm644 $srcdir/$_jarname $pkgdir/usr/share/java/scalastyle/$_jarname
  install -Dm755 $srcdir/scalastyle.sh $pkgdir/usr/bin/scalastyle
}
