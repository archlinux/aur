# Maintainer: d.woffinden
pkgname=fortune-mod-farscape
pkgver=r2221412
pkgrel=1
pkgdesc='Fortune cookies: Farscape (TV series), scraped from https://en.wikiquote.org/wiki/Farscape'
arch=('any')
url='http://github.com/dwoffinden/fortune-mod-farscape'
license=('CCPL:by-sa3.0')
makedepends=('perl' 'perl-mediawiki-api' 'perl-libwww' 'perl-lwp-protocol-https')
depends=('fortune-mod')
groups=('fortune-mods')
source=('wiki.pl')
md5sums=('3ad9f6b85b5441f271d31a2f4985c519')

pkgver() {
  cd "$srcdir"
  printf "r%s" $(perl wiki.pl revision)
}

build() {
  cd "$srcdir"
  perl wiki.pl > farscape
  strfile farscape farscape.dat
}

package() {
  cd "$srcdir"
  install -D -m644 farscape ${pkgdir}/usr/share/fortune/farscape
  install -D -m644 farscape.dat ${pkgdir}/usr/share/fortune/farscape.dat
}
