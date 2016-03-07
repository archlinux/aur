# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: bmpvieira <mail@bmpvieira.com>

pkgname=genepop
_uppkgname=Genepop
pkgver=4.5.1
pkgrel=1
pkgdesc="A population genetics software."
arch=('i686' 'x86_64')
license=('CeCILL')
url="http://kimura.univ-montp2.fr/~rousset/Genepop.htm"
depends=('gcc-libs')
source=(http://kimura.univ-montp2.fr/~rousset/${_uppkgname}V4.tar.gz)
md5sums=('3fa420ec8de1b1ef19b15866e3d9148a')

build() {
  cd "$srcdir"
  tar xfvz sources.tar.gz
  g++ -DNO_MODULES -o genepop GenepopS.cpp -O3
}

package() {
  install -Dm755 "$srcdir/genepop" "$pkgdir/usr/bin/genepop"
}
