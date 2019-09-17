# Maintainer: Václav Valíček <vaclav@valicek.name> GPG: FF05BDCA0C73BB31
# Previous Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=uftp
pkgver=4.10
pkgrel=1
pkgdesc="UFTP is an encrypted multicast file transfer program, designed 
to securely, reliably, and efficiently transfer files to multiple 
receivers simultaneously."
arch=(x86_64)
url="https://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("https://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('204d1fa6134ca7481d2594cd0353cb53e84c5f25c28541a3b1f079ad86caea5cba056bf2a95a146c79df340bdc9c953c9333f8660991ae452c7fca4d7388bf7a')

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
