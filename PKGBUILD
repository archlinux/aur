# Maintainer: Václav Valíček <vaclav@valicek.name> GPG: FF05BDCA0C73BB31
# Previous Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=uftp
pkgver=5.0
pkgrel=1
pkgdesc="UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously."
arch=(x86_64)
url="https://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("https://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('f76e86559971facd806141fae88c6c47ec8361440044e429126391c6ac17f5f6ec0c79950816f9329cbb85a6be31d0700d18f599ef0b56f8df3ebe03fad4e27a')


prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  make all || return 1
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
