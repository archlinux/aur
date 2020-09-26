# Maintainer: Mike Sampson <mike@sambodata.com>
# Contributor: Michal Soltys <soltys@ziu.info>

pkgname=nuttcp
pkgver=8.2.2
pkgrel=1
pkgdesc="TCP/UDP network testing tool - simple, easy to use, with interesting feature set."
arch=(i686 x86_64)
url="http://www.lcp.nrl.navy.mil/nuttcp/"
license=('GPL')
depends=('glibc')
install=nuttcp.install
source=(http://nuttcp.net/nuttcp/nuttcp-${pkgver}/nuttcp.c)
sha512sums=('1a52ac7dd3a4a54806567944120a1e211408ac294342a62e6be11a157018cecb4f964435ceaad1e64ff6ca5c2e83911a68ede3aadd0e23edf739d849c74ca6d3')

build() {
  cd $srcdir
  cc nuttcp.c -o nuttcp
}

package() {
  install -D -m0755 -o0 -g0 nuttcp $pkgdir/usr/bin/nuttcp
}
