# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Timothy Rice <timothy.rice@unimelb.edu.au>

pkgname=datamash
pkgver=1.2
pkgrel=1
pkgdesc='Performs basic numeric,textual and statistical operations on input textual data files'
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.gnu.org/software/datamash/"
depends=('glibc')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('e8d46fb22ccc77e5380f26cde622a733f363d388b04a2c22e7fb6de0e9d85996'
            'SKIP')
validpgpkeys=('F576AAAC1B0FF849792D8CB129A794FD2272BC86')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"

  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
