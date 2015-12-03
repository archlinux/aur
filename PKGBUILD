# Maintainer: wookietreiber <kizkizzbangbang@googlemail.com>
pkgname=scalastyle
pkgver=0.8.0
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

md5sums=('b587a28c2c18f9b16fab150a430c4ee8'
         'e942678878fe16db39279fc444afa500')

package() {
  install -Dm644 $srcdir/$_jarname     $pkgdir/usr/share/java/scalastyle/$_jarname
  install -Dm755 $srcdir/scalastyle.sh $pkgdir/usr/bin/scalastyle
}
