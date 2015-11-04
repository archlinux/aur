# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=passcheck-data
pkgver=1.5
pkgrel=1
pkgdesc='Data files for the passcheck package'
arch=('any')
url='https://github.com/maandree/passcheck'
license=('custom:public domain')
depends=()
makedepends=('make' 'coreutils' 'lrzip')
conflicts=('passcheck<1.5')
source=(https://github.com/maandree/passcheck/archive/$pkgver-data.tar.gz
        https://github.com/maandree/passcheck/archive/$pkgver.tar.gz)
sha256sums=(605cac2c724228866958bb750bb3c60efb7ce7167e1d3f07a5e610567fe7b90f
	    4a6e03a2dc37fbe623a4b93ad8898298d157c23c0a382b18621bb2aab00c90c8)


build() {
  cd "$srcdir/passcheck-$pkgver"
  mv "../passcheck-$pkgver-data/blacklist.lrz" .
  make data
}

package() {
  cd "$srcdir/passcheck-$pkgver"
  make DESTDIR="$pkgdir" install-data
}

