# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cgoban
pkgver=1.9.14
pkgrel=5
pkgdesc='SGF editor and client for connection to IGS'
url='http://cgoban1.sourceforge.net/'
arch=('x86_64')
license=('GPL2')
depends=('bash')
source=("https://downloads.sourceforge.net/project/cgoban1/cgoban1/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3b8a6fc0e989bf977fcd9a65a367aa18e34c6e25800e78dd8f0063fa549c9b62')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "$pkgdir"/usr/{bin,share/man/man6}
  make DESTDIR="$pkgdir" install
}
