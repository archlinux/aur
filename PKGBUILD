# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
pkgname=excelcompare
_pkgname=ExcelCompare
pkgver=0.7.0
pkgrel=1
pkgdesc="Command line tool (and API) for diffing Excel Workbooks"
arch=('x86_64')
url="https://github.com/na-ka-na/ExcelCompare"
license=('MIT')
depends=('java-runtime>=8')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.zip")
sha256sums=('bf5709fc7c86a59f6f535685b0e08a7c8bcb73c48c4c03e4d54b1fd816c90825')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  # install excel_cmp  lib
  install -d "$pkgdir/usr/share/java/$pkgname/lib"
  install -Dm644 lib/* "$pkgdir/usr/share/java/$pkgname/lib"
  install -Dm755 excel_cmp "$pkgdir/usr/share/java/$pkgname/excel_cmp"

  # create symlink to excel_cmp
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/java/$pkgname/excel_cmp "$pkgdir/usr/bin/excel_cmp"

}
