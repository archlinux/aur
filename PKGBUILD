# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=bundletool
pkgdesc="A command-line tool for manipulating Android App Bundles"
pkgver=1.14.0
pkgrel=1
arch=('any')
url='https://github.com/google/bundletool'
depends=('java-runtime')
jarname=bundletool-all-$pkgver.jar
source=(
  "https://github.com/google/bundletool/releases/download/$pkgver/$jarname"
  bundletool
)
noextract=("$jarname")
sha256sums=('e740e7d38562c5e8d87cc817548b2db94e42802e9a0774fdf674e758ff79694d'
            '3e00767959cb7cb78b76856ae76b61f37b481ca77f28b50a27acdc4c1820891e')

package () {
  install -Dm555 "$srcdir/$jarname" "$pkgdir/usr/share/java/bundletool/bundletool.jar"
  install -Dm755 "$srcdir/bundletool" "$pkgdir/usr/bin/bundletool"
}
