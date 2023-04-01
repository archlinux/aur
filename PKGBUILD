# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Kevin Piche <kevin@archlinux.org>

pkgname=zile
pkgver=2.6.2
pkgrel=2
pkgdesc="A small, fast, and powerful Emacs clone"
arch=('x86_64')
url="https://www.gnu.org/software/zile/"
license=('GPL3')
depends=('acl' 'gc' 'ncurses' 'glib2' 'libgee')
makedepends=('help2man' 'vala')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('77eb7daff3c98bdc88daa1ac040dccca72b81dc32fc3166e079dd7a63e42c741'
            'SKIP')
validpgpkeys=('92978852A62FA5E285B2A17468089F7380EE4A00'  # Reuben Thomas
              '24093F016FFE8602EF449BB84C8EF3DA3FD37230')  # his new key?

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
