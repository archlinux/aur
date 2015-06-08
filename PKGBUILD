# Maintainer: Jack L. Frost <fbt@fleshless.org>
pkgname=sdhcp
pkgver=0.1
pkgrel=3
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
}

md5sums=('373d165250030441d6225c6b9b324336')
