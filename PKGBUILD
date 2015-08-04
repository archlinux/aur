# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=pgpdump
pkgver=0.29
pkgrel=1
pkgdesc="PGP packet visualizer which displays the packet format"
url="http://www.mew.org/~kazu/proj/pgpdump"
arch=('x86_64' 'i686')
license=('BSD')
depends=('zlib' 'bzip2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kazu-yamamoto/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('a188df818ddf2cf1652fa31258a4643e287c33f9c5fe715e0675f522e97356aafcec708892d30c665da3127ffd366a259aeb84fc0d3a9393884ca3cc174cb59f')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix="${pkgdir}/usr"
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make install
  install -Dm 644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
