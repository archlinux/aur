# Maintainer: wookietreiber <kizkizzbangbang@googlemail.com>
pkgname=scalastyle
pkgver=0.5.0
pkgrel=1
pkgdesc="Examines your Scala code and indicates potential problems with it."
arch=(any)
url="http://www.scalastyle.org/"
license=('Apache')
depends=('java-environment' 'bash')

_scalaver="2.10"
_jarname="$pkgname-batch_$_scalaver"
_zipname="$_jarname-$pkgver"

source=("https://oss.sonatype.org/content/repositories/releases/org/scalastyle/$_jarname/$pkgver/$_zipname-distribution.zip"
        "scalastyle.sh")

md5sums=('SKIP'
         '4180c97ade523d5c83c33c487352ef2b')

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/java/scalastyle/lib"

  install -m0644 "$srcdir/$_zipname/$_jarname.jar" "$pkgdir/usr/share/java/scalastyle/$_jarname.jar"

  install -m0644 "$srcdir/$_zipname/lib"/*.jar "$pkgdir/usr/share/java/scalastyle/lib/"

  install -m0755 "$srcdir/scalastyle.sh" "$pkgdir/usr/bin/scalastyle"
}
