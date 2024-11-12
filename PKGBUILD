# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-reclen
_project=gawkextlib
pkgver=1.0.1
pkgrel=1
pkgdesc="GAWK extension - fixed-length record input parser"
arch=('x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gawk' 'glibc')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
sha256sums=('ad7631e2745d5fe3553e009e188ceaf4ff3a4653e4ce9baac731623d5decad77')

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
