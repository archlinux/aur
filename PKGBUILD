# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=pgpdump
pkgver=0.28
pkgrel=2
pkgdesc="PGP packet visualizer which displays the packet format"
url="http://www.mew.org/~kazu/proj/pgpdump"
arch=('x86_64' 'i686')
license=('BSD')
depends=('zlib' 'bzip2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kazu-yamamoto/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('b3cac90c6862dfc8784b21a09875b52a96fc8a1e2c6f5ee4aca45c6ae667064d353cadbdbd9a94eefc5992f09486fb8ec7642d0a18d9bc8d2977872c89e3bf10')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix="${pkgdir}/usr"
  make
}

package() {
  cd ${pkgname}-${pkgver}
  cat Makefile
  make install
  install -Dm 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
