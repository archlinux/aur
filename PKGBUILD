# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=bundletool
pkgdesc="A command-line tool for manipulating Android App Bundles"
pkgver=0.10.1
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
sha256sums=('ac0e18bb5f59f693b7dc3ebcb44560f24ad94aeb188f7015346081ed56cb0e3c' 'SKIP')

package () {
  install -Dm555 "$srcdir/$jarname" "$pkgdir/usr/share/java/bundletool/bundletool.jar"
  install -Dm755 "$srcdir/bundletool" "$pkgdir/usr/bin/bundletool"
}
