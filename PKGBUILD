# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=scalastyle
pkgver=0.9.0
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

md5sums=('660b6e34ef469b854e8de124e2a8d225'
         '23c4bda6a18cc167ebd9e8fb8ef6e500')

package() {
  install -Dm644 $srcdir/$_jarname     $pkgdir/usr/share/java/scalastyle/$_jarname
  install -Dm755 $srcdir/scalastyle.sh $pkgdir/usr/bin/scalastyle
}
