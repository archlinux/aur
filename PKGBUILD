pkgname=gnudos
pkgver=1.8
pkgrel=1
pkgdesc="Library designed to help new users of the GNU system, who are coming from a DOS background, fit into the picture and start using the GNU system with ease"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/gnudos/"
license=('GPL')
depends=('glibc')
makedepends=('automake' 'autoconf')
source=("https://ftp.gnu.org/gnu/gnudos/gnudos-1.8.tar.gz")
sha256sums=('67e0eaa41f774ce30d23c24f5f987f67c009911aae78ff89afdf8934a35c650a')

build()
{
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check()
{
  cd "$pkgname-$pkgver"
  make -k check
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
