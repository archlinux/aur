# Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: bmpvieira <mail@bmpvieira.com>

pkgname=genepop
_uppkgname=Genepop
pkgver=4.6
pkgrel=1
pkgdesc="A population genetics software."
arch=('i686' 'x86_64')
license=('CeCILL')
url="http://kimura.univ-montp2.fr/~rousset/Genepop.htm"
depends=('gcc-libs')
source=(http://kimura.univ-montp2.fr/~rousset/${_uppkgname}V4.tar.gz)
sha256sums=('1b6cbb4c133ea2bfb0bee728bad01e25bdd7e8574d21401d09fd93f34298ff14')

build() {
  cd "$srcdir"
  tar xfvz sources.tar.gz
  cd "Cpp"
  g++ -DNO_MODULES -o genepop GenepopS.cpp -O3
}

package() {
  install -Dm755 "$srcdir/Cpp/genepop" "$pkgdir/usr/bin/genepop"
}
