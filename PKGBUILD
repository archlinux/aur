# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=passcheck
pkgver=1.5.2
pkgrel=1
pkgdesc='Passphrase strength evaluator'
arch=('any')
url='https://github.com/maandree/passcheck'
license=('AGPL3')
depends=('python3' 'passcheck-data')
makedepends=('make' 'sed' 'coreutils' 'texinfo' 'auto-auto-complete')
install=passcheck.install
source=(https://github.com/maandree/passcheck/archive/$pkgver.tar.gz)
sha256sums=(1f55ab4c9e2f73c28f3c136384c49d95f008e7aef04303a1d018e73798516b99)


build() {
  cd "$srcdir/passcheck-$pkgver"
  make command doc shell
}

package() {
  cd "$srcdir/passcheck-$pkgver"
  make DESTDIR="$pkgdir" install-cmd install-license install-doc install-shell
}

