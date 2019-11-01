pkgname=palantir-java-format
pkgver=0.3.0
pkgrel=1
pkgdesc="Reformats Java source code to comply with Palantir Java Style"
arch=('any')
url="https://github.com/palantir/palantir-java-format"
depends=('java-runtime' 'google-java-format')
options=()
source=(https://dl.bintray.com/palantir/releases/com/palantir/javaformat/palantir-java-format/$pkgver/palantir-java-format-$pkgver.jar
        https://dl.bintray.com/palantir/releases/com/palantir/javaformat/palantir-java-format-spi/$pkgver/palantir-java-format-spi-$pkgver.jar
        palantir-java-format)
md5sums=('6805ca0f4e5f157582c161b8ef788f0d'
         'f4a068e2eb5bb261a23c4dc59fb62cc5'
         '86828c1f441b9c1a97674d7d3d035625')

package() {
  mkdir -p "$pkgdir/usr/share/java/$pkgname/"
  cp "$srcdir/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  cp "$srcdir/palantir-java-format-spi-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname-spi.jar"

  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/palantir-java-format" "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
