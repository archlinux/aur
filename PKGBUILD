# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>

pkgname=dnsmap
pkgver=0.30
pkgrel=3
pkgdesc="passive DNS network mapper"
url="https://dnsmap.googlecode.com"
arch=('i686' 'x86_64')
depends=('bash')
license=('GPL2')
source=(https://dnsmap.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('a4653fec0c407b88d1edc0d40dead19d2fa405d840b701160586c3efc90e7fccef166966af19809b7d175ed9c658b014298a991544213fb604fa9b007030e63d')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 dnsmap "${pkgdir}/usr/bin/dnsmap"
  install -Dm 755 dnsmap-bulk.sh "${pkgdir}/usr/bin/dnsmap-bulk"
  install -Dm 644 wordlist_TLAs.txt "${pkgdir}/usr/share/dnsmap/wordlist_TLAs.txt"
  install -Dm 644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
