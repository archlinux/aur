# Maintainer: Markus Sommer <markus@splork.de>
pkgname=mgen
pkgver=5.1.1
pkgrel=1
pkgdesc="Multi-Generator traffic generation tool"
arch=('i686' 'x86_64')
url="https://github.com/USNavalResearchLaboratory/mgen"
license=('BSD')
depends=(libpcap)
makedepends=(gcc)
source=("https://github.com/USNavalResearchLaboratory/mgen/releases/download/V5.1.1/src-mgen-$pkgver-protolib.tar.gz")
sha512sums=('c24743d17b2ecfe4d76857112253b00a523218733eebcc26c0c80ba2be24f1b492149042b9106e2e04773833c65ea5b74254c46cb3f98163cfd1eb06d0a52cb2')

build() {
  cd "$srcdir/mgen-$pkgver/makefiles"
  make -f Makefile.linux
}

package() {
  cd "$srcdir/mgen-$pkgver/makefiles"
  install -D -m 0755 mgen "$pkgdir/usr/bin/mgen"
  install -D -m 0755 mgen "$pkgdir/usr/bin/mpmgr"

  install -D -m 0644 "$srcdir/mgen-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
