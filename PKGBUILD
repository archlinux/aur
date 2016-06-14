# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=javasnoop
pkgver=1.1RC2
pkgrel=1
pkgdesc="A tool to test the security of Java applications"
arch=(any)
url="https://code.google.com/archive/p/javasnoop/"
license=('GPL3')
depends=(jre8-openjdk)
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/javasnoop/JavaSnoop-1.1-RC2.zip")
md5sums=(f1960ef82c4b5c6a389e44915a9f1d3d)
validpgpkeys=()

package() {
             install -dm755 "$pkgdir"/usr/share/"$pkgname"
             install -dm755 "$pkgdir"/usr/bin
             cp -rf "$srcdir"/JavaSnoop/* "$pkgdir"/usr/share/"$pkgname"/
             chmod +x "$pkgdir"/usr/share/"$pkgname"/startup.sh
             echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre && cd /usr/share/javasnoop/ && ./startup.sh" >> "$pkgname"
             chmod +x "$pkgname"
             cp "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
