pkgname=swath
pkgver=0.6.1
pkgrel=1
pkgdesc="A general-purpose utility for analyzing word boundaries in Thai text and inserting predefined word delimiter codes"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('gcc-libs' 'libdatrie>=0.2.1')
groups=('texlive-lang')
source=(https://github.com/tlwg/swath/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz)
url="http://linux.thai.net/projects/swath"
sha1sums=('a2c8ce01401220e36c4a9280a1791045382b38c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
