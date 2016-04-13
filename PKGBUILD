# Contributor: muhas <muhas@mail.ru>

pkgname=fortune-mod-lorquotes
pkgver=2016.04
pkgrel=1
pkgdesc="The selected citations from a site Linux.Org.Ru (UTF8) "
url="http://lorquotes.ru/"
license="?"
depends=('fortune-mod')
makedepends=('wget')
groups=('fortune-mods')
arch=('any')
md5sums=()

build() {
 cd ${srcdir}/
 wget http://lorquotes.ru/fortraw.php -O fortraw.php
 iconv --from-code=KOI8-R --to-code=UTF8 --output=lorquotes fortraw.php
 strfile lorquotes
}
package() {
 mkdir -p ${pkgdir}/usr/share/fortune/
 cp lorquotes lorquotes.dat ${pkgdir}/usr/share/fortune/
}
