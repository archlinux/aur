# Maintainer: git-rep <git-rep@openmailbox.org>

pkgname=vmap
pkgver=0.3
pkgrel=1
pkgdesc="A Vulnerability-Exploit desktop finder."
arch=('i686' 'x86_64')
url="https://github.com/git-rep/vmap"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'curl' 'libxml++')
source=("https://github.com/git-rep/vmap/archive/v${pkgver}.tar.gz")
sha1sums=('1c87654a60f85d4d4b6b548bac30284d9b801b0b')

build() {
  cd "$srcdir/vmap-$pkgver"
  
  qmake
  
  make
}

package() {
  cd "$srcdir/vmap-$pkgver"

  install -Dm755 vmap "$pkgdir/usr/bin/vmap"
}
