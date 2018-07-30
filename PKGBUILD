# Maintainer: Luke R. <g4jc@bulletmail.org> GPG:  c25519/D85D2F527B0

pkgname=uftp
pkgver=4.9.7
pkgrel=1
pkgdesc="UFTP is an encrypted multicast file transfer program, designed 
to securely, reliably, and efficiently transfer files to multiple 
receivers simultaneously."
arch=(x86_64)
url="https://uftp-multicast.sourceforge.net/"
license=('GPL3')
makedepends=('gcc' 'openssl')
source=("https://downloads.sourceforge.net/project/$pkgname-multicast/source-tar/$pkgname-$pkgver.tar.gz")
sha512sums=('924fd858081308a0a4d603fd19401981592ec67b7f20a0ed5a38130065ed2a41bb71d9d3bf7c609722300e7cfea6a8f9a2704c63b1b1efa15105cce52c3ee9f6')

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
