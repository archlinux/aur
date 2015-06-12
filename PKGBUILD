# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=correctpony
pkgver=2.1
pkgrel=1
pkgdesc="Passphrase generator based on http://xkcd.com/936/"
arch=('any')
url="https://github.com/maandree/correctpony"
license=('AGPL3')
depends=('java-runtime>=6' 'argparser')
makedepends=('java-environment>=6' 'argparser' 'make' 'sed' 'coreutils' 'auto-auto-complete' 'texinfo' 'gzip')
provides=('correctpony')
conflicts=('correctpony')
source=($url/archive/$pkgver.tar.gz)
sha256sums=(265f9fb11759e0a7245b96cbaa34f42b0fe2ee00f2f6721e1e53f7d25f4d5f0e)

build() {
  cd "$srcdir/correctpony-$pkgver"
  make -B
}

package() {
  cd "$srcdir/correctpony-$pkgver"
  make DESTDIR="$pkgdir/" install
}
