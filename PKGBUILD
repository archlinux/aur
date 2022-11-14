# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=bundletool
pkgdesc="A command-line tool for manipulating Android App Bundles"
pkgver=1.13.1
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
sha256sums=('a305e3ec5491f7c20fb9a5a4506a6fe1ee9ce1ce9721816cc59647d0e59872ef'
            '3e00767959cb7cb78b76856ae76b61f37b481ca77f28b50a27acdc4c1820891e')

package () {
  install -Dm555 "$srcdir/$jarname" "$pkgdir/usr/share/java/bundletool/bundletool.jar"
  install -Dm755 "$srcdir/bundletool" "$pkgdir/usr/bin/bundletool"
}
