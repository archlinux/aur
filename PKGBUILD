# Mantainer: M0Rf30

pkgname=drbl-experimental
_name=drbl
pkgver=2.20.2
pkgrel=1
pkgdesc="Diskless Remote Boot in Linux: manage the deployment of the GNU/Linux operating system across many clients"
arch=('i686' 'x86_64')
url="http://drbl.sourceforge.net/"
license=('GPL')
depends=('perl' 'bc')
makedepends=('vim')
backup=('etc/drbl/drbl.conf')
provides=('drbl')
source=(http://free.nchc.org.tw/drbl-core/src/unstable/$_name-$pkgver.tar.bz2
        usrbin.patch)

prepare() {
  cd $_name-$pkgver

  patch -Np0 -i "$srcdir"/usrbin.patch
}

build() {
  cd $_name-$pkgver

  make  
}

package() {
  cd $_name-$pkgver

  make DESTDIR="$pkgdir" install
}


md5sums=('8c2fb4b73fc9b6ba780a38bf198bd637'
         'f01eac478f1ae62f505de645de96c68a')
