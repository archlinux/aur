# Maintainer: git-rep <git-rep@protonmail.com>

pkgname=vmap
pkgver=0.4.1
pkgrel=1
pkgdesc="A Vulnerability-Exploit desktop finder."
arch=('i686' 'x86_64')
url="https://gitlab.com/git-rep/vmap"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'curl' 'libxml++')
source=("https://gitlab.com/git-rep/vmap/-/archive/v${pkgver}/vmap-v${pkgver}.tar.gz")
sha1sums=('39ee2a982cd54110e65428dfd0d963fb29ff7c0c')

build() {
  cd "$srcdir/vmap-v$pkgver"
  
  qmake
  
  make
}

package() {
  cd "$srcdir/vmap-v$pkgver"

  install -Dm755 vmap "$pkgdir/usr/bin/vmap"
}
