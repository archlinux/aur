# Maintainer: e.kovetskiy@gmail.com
pkgname=palantir-java-format
pkgver=1.0.1
pkgrel=1
pkgdesc="Reformats Java source code to comply with Palantir Java Style"
arch=('any')
url="https://github.com/palantir/palantir-java-format"
depends=('java-runtime' 'google-java-format')
options=()
source=(https://dl.bintray.com/palantir/releases/com/palantir/javaformat/palantir-java-format/$pkgver/palantir-java-format-$pkgver.jar
        https://dl.bintray.com/palantir/releases/com/palantir/javaformat/palantir-java-format-spi/$pkgver/palantir-java-format-spi-$pkgver.jar
        palantir-java-format)
md5sums=('386a65231527a3962e142edb7cbf2c24'
         '4e42c4135eab5f4d7557e3d19607f452'
         '86828c1f441b9c1a97674d7d3d035625')

package() {
  mkdir -p "$pkgdir/usr/share/java/$pkgname/"
  cp "$srcdir/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  cp "$srcdir/palantir-java-format-spi-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname-spi.jar"

  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/palantir-java-format" "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
