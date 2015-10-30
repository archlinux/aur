# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=passcheck
pkgver=1.5
pkgrel=1
pkgdesc='Passphrase strength evaluator'
arch=('any')
url='https://github.com/maandree/passcheck'
license=('AGPL3')
depends=('python3' 'passcheck-data')
makedepends=('make' 'sed' 'coreutils' 'texinfo' 'auto-auto-complete')
install=passcheck.install
source=(https://github.com/maandree/passcheck/archive/$pkgver.tar.gz)
sha256sums=(4a6e03a2dc37fbe623a4b93ad8898298d157c23c0a382b18621bb2aab00c90c8)


build() {
  cd "$srcdir/passcheck-$pkgver"
  make command doc shell
}

package() {
  cd "$srcdir/passcheck-$pkgver"
  make DESTDIR="$pkgdir" install-cmd install-license install-doc install-shell
}

