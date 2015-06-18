# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: bmpvieira <mail@bmpvieira.com>

pkgname=genepop
_uppkgname=Genepop
pkgver=4.3
pkgrel=1
pkgdesc="A population genetics software."
arch=('i686' 'x86_64')
license=('CeCILL')
url="http://kimura.univ-montp2.fr/~rousset/Genepop.htm"
depends=('gcc-libs')
source=(http://kimura.univ-montp2.fr/~rousset/${_uppkgname}V4.tar.gz)
md5sums=('4cc06109082c7e936e1c422adabfe6bf')

build() {
  cd "$srcdir"
  tar xfvz sources.tar.gz
  g++ -DNO_MODULES -o genepop GenepopS.cpp -O3
}

package() {
  install -Dm755 "$srcdir/genepop" "$pkgdir/usr/bin/genepop"
}
