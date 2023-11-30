# Maintainer: Václav Valíček <vaclav@valicek.name> GPG: FF05BDCA0C73BB31
# Previous Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=uftp
pkgver=5.0.2
pkgrel=1
pkgdesc="UFTP is an encrypted multicast file transfer program, designed to securely, reliably, and efficiently transfer files to multiple receivers simultaneously."
arch=(x86_64)
url="https://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("https://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('2359b62182a504f3e05c1167d41befe0c718cc5be9d382baf5c0a052f261f034c082354e9b94cbe9bd1fc3bbfcd6790e490fa720da54d5875df66501e52ea63e')


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
