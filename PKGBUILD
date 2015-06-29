# Contributor: Damien Churchill <damoxc@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=connect
pkgver=1.101
pkgrel=4
pkgdesc="makes socket connection using SOCKS4/5 and HTTP tunnel."
arch=('i686' 'x86_64')
url="https://bitbucket.org/gotoh/connect"
license=('GPL')
depends=()
makedepends=()
source=(http://archive.ubuntu.com/ubuntu/pool/universe/c/connect-proxy/connect-proxy_$pkgver.orig.tar.gz)
sha256sums=('1f013eee728b1751a7bdb19c5301549e4e865ba2cac79083bbeb932fb8ae8d7f')
_hgversion='gotoh-connect-cf9579815b7e'

build() {
  cd "${srcdir}/connect-proxy-${pkgver}"
  make connect
}

package() {
  cd "${srcdir}/connect-proxy-${pkgver}"
  mkdir -p ${pkgdir}/usr/bin
  install connect ${pkgdir}/usr/bin
}
