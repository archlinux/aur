# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: jerry73204 <jerry73204@gmail.com>
# Contributor: piojo

pkgname=pxz
pkgver=4.999.9beta.20091201
_pkgver=4.999.9beta
pkgrel=6
pkgdesc='Runs LZMA compression of different parts of an input file on multiple cores and processors simultaneously'
arch=('x86_64' 'i686')
url='https://jnovy.fedorapeople.org/pxz/'
license=('GPL2')
depends=('xz')
source=("https://jnovy.fedorapeople.org/$pkgname/$pkgname-${pkgver}git.tar.xz"
        Makefile.patch)
b2sums=('e5570c46904cbb8cc637ece1b4451b5d5f79261aa808f39a90bf6fd026603875dffadf85ff16b8dda370d146c85bc93eac8cc533f62dc3c54651e01b3532b80f'
        '5ccf0a5725d06f410238e9961e028ac7b0637d99c277fa26ae09e7fc02fad683c20da9ada8370e6ac4d991bbbafed70e560bd44008b1c0a58526d9a0517785e9')

prepare() {
  cd "$pkgname-$_pkgver"

  patch -Np2 -i "$srcdir/Makefile.patch"
}

build() {
  cd "$pkgname-$_pkgver"

  make
}

package() {
  cd "$pkgname-$_pkgver"

  make DESTDIR="$pkgdir" install
}
