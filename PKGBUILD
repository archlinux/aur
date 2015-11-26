# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=passcheck
pkgver=1.5.3
pkgrel=1
pkgdesc='Passphrase strength evaluator'
arch=('any')
url='https://github.com/maandree/passcheck'
license=('AGPL3')
depends=('python3' 'passcheck-data')
makedepends=('make' 'sed' 'coreutils' 'texinfo' 'auto-auto-complete')
install=passcheck.install
source=(https://github.com/maandree/passcheck/archive/$pkgver.tar.gz)
sha256sums=(d530dbeb0ce7686b9ac12a86041656a302b6716ef54a36fc1aa7828ceb910fd8)


build() {
  cd "$srcdir/passcheck-$pkgver"
  make command doc shell
}

package() {
  cd "$srcdir/passcheck-$pkgver"
  make DESTDIR="$pkgdir" install-cmd install-license install-doc install-shell
}

