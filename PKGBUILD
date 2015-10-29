# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=passcheck
pkgver=1.4
pkgrel=1
pkgdesc='Passphrase strength evaluator'
arch=('any')
url='https://github.com/maandree/passcheck'
license=('AGPL3')
depends=('python3')
makedepends=('make' 'sed' 'coreutils' 'texinfo' 'auto-auto-complete')
install=passcheck.install
source=(https://github.com/maandree/passcheck/archive/$pkgver.tar.gz)
sha256sums=(901483f7e4d111f0e1135e16d60e4c573ff72e39bac0c4337df7b46ac62780ec)


build() {
  cd "$srcdir/passcheck-$pkgver"
  make
}

package() {
  cd "$srcdir/passcheck-$pkgver"
  make DESTDIR="$pkgdir" install
}

