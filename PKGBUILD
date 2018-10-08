# Maintainer: Václav Valíček <vaclav@valicek.name> GPG: FF05BDCA0C73BB31
# Previous Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=uftp
pkgver=4.9.8
pkgrel=1
pkgdesc="UFTP is an encrypted multicast file transfer program, designed 
to securely, reliably, and efficiently transfer files to multiple 
receivers simultaneously."
arch=(x86_64)
url="https://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("https://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('04875ddc59cdd9cfa88d642aeb9ea4418a99eca12057f54c949ec5aecee85a8a78803ebdeefe11a29a298a151bb5eb19d6c6c5656f26e17639a86308a2946ef5')

-prepare() {
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
