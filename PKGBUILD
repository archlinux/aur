# Maintainer: d.woffinden
pkgname=fortune-mod-farscape
pkgver=r1813446
pkgrel=1
pkgdesc='Fortune cookies: Farscape (TV series), scraped from https://en.wikiquote.org/wiki/Farscape'
arch=('any')
url='http://github.com/dwoffinden/fortune-mod-farscape'
license=('CCPL:by-sa3.0')
makedepends=('perl' 'perl-mediawiki-api' 'perl-libwww')
depends=('fortune-mod')
groups=('fortune-mods')
source=('wiki.pl')
md5sums=('c298998fe5c54870fbc12ce315ef311f')

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
