# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=nsoq
pkgver=1.9.5
pkgrel=1
pkgdesc="Network Security Tool for packet manipulation that allows a large number of options"
url="http://www.nsoq.org/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL3')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/FelipeEcker/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('b73039880e75a1a43be25ea8d66cbaff9b2340f1cd991808fed00a02e8e4ba9ede62d2a965882689e38b989c77274155da06a44a5f5102c2c2801a18bdec6664')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 bin/nsoq "${pkgdir}/usr/bin/nsoq"
  install -Dm 644 CHANGELOG README.md docs/nsoq.txt -t "${pkgdir}/usr/share/doc/nsoq"
  install -Dm 644 docs/nsoq.8.gz "${pkgdir}/usr/share/man/man8/nsoq.8.gz"
}

# vim: ts=2 sw=2 et:
