# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-aregex
_project=gawkextlib
pkgver=1.1.0
pkgrel=5
pkgdesc="GAWK extension - approximate regex (fuzzy) matching"
arch=('x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gawkextlib' 'glibc' 'tre')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('e1a8610596606be18d964e478ce0a833')
sha256sums=('dcbf5fd243a1ea09d5c5de7e49a2c15aadc78646b2100359d4ce834df0e47afe')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
