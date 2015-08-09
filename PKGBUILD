# Maintainer: Benjamin James <benjamin-james@utulsa.edu>:
pkgname=fortune-mod-darkknight
pkgver=20091218
pkgrel=2
pkgdesc="Fortune cookies: batman The Dark Knight (Movie)."
arch=('any')
license=('custom')
depends=(fortune-mod)
source="fortunes.txt"
url="http://www.moviequotedb.com/movies/dark-knight-the.html"
md5sums=('1f43dd05cf18932dc6b34988aa2b9e17')

build() {
  cd $startdir/src

  iconv -f iso-8859-1 -t utf8 fortunes.txt --output darkknight
  strfile ./darkknight
  mkdir -p $startdir/pkg/usr/share/fortune/

  install -D -m644 darkknight $startdir/pkg/usr/share/fortune/darkknight
  install -D -m644 darkknight.dat $startdir/pkg/usr/share/fortune/darkknight.dat

}
