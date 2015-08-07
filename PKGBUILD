# Maintainer: Simone Baratta -- Conte91 <at> gmail <dot> com
pkgname=smartsim-git
pkgver=r73.20aa4bd
pkgrel=1
pkgdesc="SmartSim is a digital logic circuit design and simulation package."
arch=('any')
license=('GPL3')
_reponame='SmartSim'
_authorname='ashleynewson'
url="http://github.com/$_authorname/$_reponame"
source=("git+https://github.com/$_authorname/$_reponame.git")

pkgver() {
  cd "$srcdir/$_reponame"
  echo "r`git rev-list --count HEAD`.`git rev-parse --short HEAD`"
}

build(){
  cd "$srcdir/$_reponame"
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_reponame
  make DESTDIR=$pkgdir install
}

md5sums=('SKIP')
