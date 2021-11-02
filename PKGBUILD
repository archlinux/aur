# Contributor: muhas <muhas@mail.ru>

pkgname=fortune-mod-lorquotes
pkgver=2021.07
pkgrel=1
pkgdesc="The selected citations from a site Linux.Org.Ru (UTF8) "
url="http://lorquotes.ru/"
license=("?")
depends=('fortune-mod')
groups=('fortune-mods')
arch=('any')
source=('lorquotes.zst')
sha256sums=('92ae169e46d5dc79b17d01d30e4cb16c4002d9c76eee5f1af3180c206aadc9ff')

build() {
  zstdcat -c lorquotes.zst > ${srcdir}/lorquotes
  cd ${srcdir}/
#  wget http://lorquotes.ru/fortraw.php -O fortraw.php
#  iconv --from-code=KOI8-R --to-code=UTF8 --output=lorquotes fortraw.php
  strfile lorquotes
}
package() {
 mkdir -p ${pkgdir}/usr/share/fortune/
 cp lorquotes lorquotes.dat ${pkgdir}/usr/share/fortune/
}