# Maintainer: Mario Rodas <marsam@users.noreply.github.com>

pkgname=lightning
pkgver=2.1.2
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('zlib')
options=()
provides=()
source=("https://ftp.gnu.org/gnu/lightning/lightning-${pkgver}.tar.gz")
sha256sums=('9b289ed1c977602f9282da507db2e980dcfb5207ee8bd2501536a6852a157a69')

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
