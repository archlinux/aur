# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=bundletool
pkgdesc="A command-line tool for manipulating Android App Bundles"
pkgver=1.14.1
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
sha256sums=('2f78f9c8d059db1c7ea4ac6ffb2527466af03838d150b70f4b77fe7deefca011'
            '3e00767959cb7cb78b76856ae76b61f37b481ca77f28b50a27acdc4c1820891e')

package () {
  install -Dm555 "$srcdir/$jarname" "$pkgdir/usr/share/java/bundletool/bundletool.jar"
  install -Dm755 "$srcdir/bundletool" "$pkgdir/usr/bin/bundletool"
}
