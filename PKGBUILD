# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=bundletool
pkgdesc="A command-line tool for manipulating Android App Bundles"
pkgver=1.18.3
pkgrel=1
arch=('any')
url='https://github.com/google/bundletool'
license=('Apache-2.0')
depends=('java-runtime')
jarname=bundletool-all-$pkgver.jar
source=(
  "https://github.com/google/bundletool/releases/download/$pkgver/$jarname"
  bundletool
)
noextract=("$jarname")
sha256sums=('a099cfa1543f55593bc2ed16a70a7c67fe54b1747bb7301f37fdfd6d91028e29'
            '3e00767959cb7cb78b76856ae76b61f37b481ca77f28b50a27acdc4c1820891e')

package () {
  install -Dm555 "$srcdir/$jarname" "$pkgdir/usr/share/java/bundletool/bundletool.jar"
  install -Dm755 "$srcdir/bundletool" "$pkgdir/usr/bin/bundletool"
}
