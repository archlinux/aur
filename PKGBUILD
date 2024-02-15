# Maintainer: Václav Valíček <vaclav@valicek.name> GPG: FF05BDCA0C73BB31
# Previous Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=uftp
pkgver=5.0.3
pkgrel=1
pkgdesc="UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously."
arch=(x86_64)
url="https://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("https://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('edd603cf3ecb363a21365db7b1697ac44d12099c6699cf50c02f4a01ad95a458470308c69446a2d2825c5f4882833c384ad4f658e09ddf80dcab1cb2180f8b54')


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
