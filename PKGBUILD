# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=cve-check-tool
pkgver=5.2
pkgrel=1
pkgdesc="Automated tool for checking known (public) CVEs"
arch=('i686' 'x86_64')
url="https://github.com/ikeydoherty/cve-check-tool"
license=('GPL2')
depends=('curl' 'json-glib' 'libxml2' 'sqlite')
makedepends=('check')
source=(https://github.com/ikeydoherty/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('779163a613b187007a1a2cd120658d5a3e5e419a02e618b593f7e84f362f10a0')

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
