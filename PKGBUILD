pkgname=gnudos
pkgver=1.10
pkgrel=1
pkgdesc="Library designed to help new users of the GNU system, who are coming from a DOS background, fit into the picture and start using the GNU system with ease"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/gnudos/"
license=('GPL')
depends=('glibc')
source=(https://ftp.gnu.org/gnu/gnudos/gnudos-$pkgver.tar.gz)
sha256sums=('b263670df092b77068bb4a9368ed42efdb8953fb732d12c1091e2a75135fc8aa')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver

  make check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
