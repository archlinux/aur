# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=scalastyle
pkgver=1.0.0
pkgrel=1
pkgdesc="Examines your Scala code and indicates potential problems with it."
arch=(any)
url="http://www.scalastyle.org/"
license=('Apache')
depends=('java-environment' 'bash')

_scalaver="2.11"

_jarname="${pkgname}_$_scalaver-$pkgver-batch.jar"

source=("https://oss.sonatype.org/service/local/repositories/releases/content/org/scalastyle/${pkgname}_$_scalaver/$pkgver/$_jarname"
        "scalastyle.sh")

noextract=('$_jarname')

md5sums=('9dff009c3068cabd1982ceee290830e8'
         'c82563227591520b6498604f2e3f6249')

package() {
  install -Dm644 $srcdir/$_jarname     $pkgdir/usr/share/java/scalastyle/$_jarname
  install -Dm755 $srcdir/scalastyle.sh $pkgdir/usr/bin/scalastyle
}
