# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=icmptunnel-git
pkgver=r46.308ba3b
pkgrel=1
pkgdesc="Transparently tunnel your IP traffic through ICMP echo and reply packets."
arch=('i686' 'x86_64')
url="https://github.com/DhavalKapil/icmptunnel"
license=('MIT')
makedepends=('git')
provides=('icmptunnel')
conflicts=('icmptunnel')
source=('git://github.com/DhavalKapil/icmptunnel.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/icmptunnel"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "$srcdir/icmptunnel"
  make
}

package(){
  cd "$srcdir/icmptunnel"
  install -Dm0755 icmptunnel "$pkgdir"/usr/bin/icmptunnel 
}
