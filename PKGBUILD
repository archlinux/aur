# Maintainer: Dane Johnson <dane@danejohnson.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=zile
pkgver=2.6.4
pkgrel=3
pkgdesc="A small, fast, and powerful Emacs clone"
arch=('x86_64')
url="https://www.gnu.org/software/zile/"
license=('GPL-3.0-only')
depends=('ncurses' 'glib2' 'libgee')
makedepends=('help2man' 'vala')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('d5d44b85cb490643d0707e1a2186f3a32998c2f6eabaa9481479b65caeee57c0'
            'SKIP')
validpgpkeys=('92978852A62FA5E285B2A17468089F7380EE4A00'  # Reuben Thomas
              '24093F016FFE8602EF449BB84C8EF3DA3FD37230')  # his new key?

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr CFLAGS="-fpermissive"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
