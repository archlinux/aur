# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=foxitreader-bin
rln=FoxitReader
pkgver=1.1
pkgrel=2
pkgdesc="A small, fast PDF viewer builded from rpm"
arch=('i686' 'x86_64')
url="http://www.foxitsoftware.com/pdf/desklinux/"
license=('custom')
[[ $CARCH = x86_64 ]] && depends=('desktop-file-utils' 'lib32-gtk2' 'lib32-libxdamage' 'lib32-sqlite3') || depends=('desktop-file-utils' 'gtk2' 'sqlite3')
makedepends=('rpmextract')
source=(http://cdn04.foxitsoftware.com/pub/foxit/reader/desktop/linux/1.x/1.1/enu/${rln}-${pkgver}-0.fc9.i386.rpm)
md5sums=('bc1857288c10cc7a2989b3e82119cac1')

build() {
  cd "$srcdir"
  rpmextract.sh "$rln-$pkgver-0.fc9.i386.rpm"
}
package() {
  cp -r "$srcdir/usr" "$pkgdir/usr"
}
