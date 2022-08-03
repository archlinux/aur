# Maintainer: Stunts <stunts@pinamartins.com>
# Contributor: bmpvieira <mail@bmpvieira.com>

pkgname=genepop
pkgver=4.7.5
pkgrel=1
pkgdesc="A population genetics software."
arch=('i686' 'x86_64')
license=('CeCILL')
url="http://kimura.univ-montp2.fr/~rousset/Genepop.htm"
depends=('gcc-libs')
source=(http://kimura.univ-montp2.fr/~rousset/sources.tar.gz)
sha256sums=('6e1b28e1014a1356655489289adc2eb3230651f607d9ae0d409dc8fbeaa8bfbf')

build() {
  cd "$srcdir"
  tar xfvz sources.tar.gz
  g++ -std=c++11 -o genepop *.cpp -O3
}

package() {
  install -Dm755 "$srcdir/genepop" "$pkgdir/usr/bin/genepop"
}
