# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mickey
pkgver=0.0.1
pkgrel=2
pkgdesc="The world's simplest self-contained and easily reviewable Bitcoin address generator"
arch=('any')
depends=('openssl')
makedepends=('gcc')
optdepends=('qrencode: Create a QR code from private keys')
url="https://github.com/bkkcoins/misc/tree/master/mickey"
license=('AGPL3')
source=(mickey.c
        mickey.install)
sha256sums=('2deea9fbef2eac95b662396c6df28f831b2b924a6240dee9a629ea52708add63'
            'f2ff5b30ed8d7f7fd0f317faecebcd68aa52022bedb100b75b4c198bc40f3815')
provides=('mickey')
conflicts=('mickey')
install=mickey.install

build() {
  cd "$srcdir"
  gcc -o mickey mickey.c -lcrypto
}

package() {
  cd "$srcdir"
  install -D -m755 mickey "${pkgdir}/usr/bin/mickey"
}
