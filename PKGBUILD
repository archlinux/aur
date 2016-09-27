# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=lightning
pkgver=2.1.0
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('zlib')
options=()
provides=()
source=('https://ftp.gnu.org/gnu/lightning/lightning-2.1.0.tar.gz')
sha256sums=('1fa3a2421852598b3162d6765645bb3cd0fccb5f0c105d0800c64c8428b749a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# Local Variables:
# compile-command: "makepkg -sm && mksrcinfo"
# End:
