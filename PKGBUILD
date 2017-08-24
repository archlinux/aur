# Maintainer: git-rep <git-rep@openmailbox.org>

pkgname=vmap
pkgver=0.2
pkgrel=1
pkgdesc="A Vulnerability-Exploit desktop finder."
arch=('i686' 'x86_64')
url="https://github.com/git-rep/vmap"
license=('GPL')
depends=('qt5-base' 'qt5-svg' 'openssl' 'libxml++')
source=("https://github.com/git-rep/vmap/archive/v${pkgver}.tar.gz")
sha1sums=('a6376568ddd0192c39c42d85c81e6a0c995d128d')

build() {
  cd "$srcdir/vmap-$pkgver"
  
  qmake
  
  make
}

package() {
  cd "$srcdir/vmap-$pkgver"

  install -Dm755 vmap "$pkgdir/usr/bin/vmap"
}
