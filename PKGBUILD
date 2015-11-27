# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=passcheck
pkgver=1.6
pkgrel=1
pkgdesc='Passphrase strength evaluator'
arch=('any')
url='https://github.com/maandree/passcheck'
license=('AGPL3')
depends=('python3' 'passcheck-data')
makedepends=('make' 'sed' 'coreutils' 'texinfo' 'auto-auto-complete')
install=passcheck.install
source=(https://github.com/maandree/passcheck/archive/$pkgver.tar.gz)
sha256sums=(d6a2cc59f0f2d499e2acfb9ad6041888a154a5c935f1d3a123b5f73c19917f47)


build() {
  cd "$srcdir/passcheck-$pkgver"
  make command info shell
}

package() {
  cd "$srcdir/passcheck-$pkgver"
  make DESTDIR="$pkgdir" install-cmd install-license install-info install-man install-shell
}

