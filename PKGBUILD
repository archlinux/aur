pkgname=gnudos
pkgver=1.9
pkgrel=1
pkgdesc="Library designed to help new users of the GNU system, who are coming from a DOS background, fit into the picture and start using the GNU system with ease"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/gnudos/"
license=('GPL')
depends=('glibc')
source=(https://ftp.gnu.org/gnu/gnudos/gnudos-$pkgver.tar.gz)
sha1sums=('49df5660f564b3c4ce73bf5341b6a37dbac427dd')

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
