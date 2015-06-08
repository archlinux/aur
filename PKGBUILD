# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: piojo

pkgname=pxz
pkgver=4.999.9beta.20091201
_pkgver=4.999.9beta
pkgrel=4
pkgdesc="Runs LZMA compression of different parts of an input file on multiple cores and processors simultaneously"
arch=('x86_64' 'i686')
url="http://jnovy.fedorapeople.org/pxz/"
license=('GPL2')
depends=('xz')
source=(http://jnovy.fedorapeople.org/$pkgname/$pkgname-${pkgver}git.tar.xz
        Makefile.patch)
md5sums=('4ae3926185978f5c95c9414dc4634451'
         '08db9905383919be1ae37861f0389773')

prepare() {
  cd $pkgname-$_pkgver

  patch -Np2 -i "$srcdir"/Makefile.patch
}

build() {
  cd $pkgname-$_pkgver

  make
}

package() {
  cd $pkgname-$_pkgver

  make DESTDIR="$pkgdir" install
}
