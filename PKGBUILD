pkgname=consel
pkgver=2011.05.12
pkgrel=0
pkgdesc="Assessing the confidence of phylogenetic tree selection https://doi.org/10.1093/bioinformatics/17.12.1246"
arch=('x86_64')
url="http://stat.sys.i.kyoto-u.ac.jp/prog/consel/"
license=('GPL2')
makedepends=('make' 'gcc' 'git')
source=("git+https://github.com/shimo-lab/consel.git")
md5sums=('SKIP')
pkgver(){
  cd "$pkgname"/src
  printf $(head -n1 ChangeLog | awk {'print $1'} | sed 's/-/./g')
}
build(){
  cd $pkgname/src
  make
}

package() {
  cd $pkgname/src
  make bindir="$pkgdir/usr/bin" install
}
