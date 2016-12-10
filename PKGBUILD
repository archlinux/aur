# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=cve-check-tool
pkgver=5.6.4
pkgrel=1
pkgdesc="Automated tool for checking known (public) CVEs"
arch=('i686' 'x86_64')
url="https://github.com/ikeydoherty/cve-check-tool"
license=('GPL2')
depends=('curl' 'json-glib' 'libxml2' 'sqlite')
makedepends=('check')
source=(https://github.com/ikeydoherty/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}"/ install
}

# vim:set ts=2 sw=2 et:
