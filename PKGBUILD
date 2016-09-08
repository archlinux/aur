# Mantainer: M0Rf30
_name=drbl
pkgname=${_name}-experimental
pkgver=2.21.1
pkgrel=1
pkgdesc="Diskless Remote Boot in Linux: manage the deployment of the GNU/Linux operating system across many clients"
arch=('i686' 'x86_64')
url="http://drbl.sourceforge.net/"
license=('GPL')
depends=('perl' 'bc')
makedepends=('vim')
backup=('etc/drbl/drbl.conf')
provides=('drbl')
source=(http://free.nchc.org.tw/drbl-core/src/unstable/$_name-$pkgver.tar.xz
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

md5sums=('883215a326def7dad3d4434db65150b2'
         'f01eac478f1ae62f505de645de96c68a')
