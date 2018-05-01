# Maintainer: Katy Moe <arch@katy.moe>
pkgname=gnudos
pkgver=1.11
pkgrel=1
pkgdesc="Library designed to help new users of the GNU system, who are coming from a DOS background, fit into the picture and start using the GNU system with ease"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/gnudos/"
license=('GPL')
depends=('glibc')
source=(
	"https://ftp.gnu.org/gnu/gnudos/gnudos-$pkgver.tar.gz"
	"https://ftp.gnu.org/gnu/gnudos/gnudos-$pkgver.tar.gz.sig"
)
sha256sums=('02585f0d1ec314ec661c7518a5742dbb47611c0433410b49b4437869031b0cc5'
            'SKIP')
validpgpkeys=('893ECEDAE0BA2F86C2333F9928229E699E9C841A') # Mohammed Isam <yahoo: mohammed_isam1984>

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
