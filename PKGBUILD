# Maintainer: Jack L. Frost <fbt@fleshless.org>
pkgname=sdhcp
pkgver=0.1
pkgrel=4
pkgdesc="Suckless dhcp client"
arch=( 'i686' 'x86_64' )
url="http://git.2f30.org/sdhcp/"
license=( 'MIT/X' )
makedepends=( 'git' )
options=( 'strip' )
source=( "http://git.2f30.org/sdhcp/snapshot/sdhcp-${pkgver}.tar.gz" )

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # The makefile has 'sbin' hardcoded :(
  cd "$pkgdir/usr"
  mv sbin bin
}

sha1sums=('7c01074809f54fa5f581b5915b49c1a20dfaa265')
