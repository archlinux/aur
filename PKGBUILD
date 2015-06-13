# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vdmfec
pkgver=1.0
pkgrel=1
pkgdesc="Save and recover data from unreliable media"
arch=('i686' 'x86_64')
url="http://members.tripod.com/professor_tom/archives/index.html"
license=('GPL')
source=(http://members.tripod.com/professor_tom/archives/$pkgname-$pkgver.tgz)
md5sums=('3f4544593359e87674f81a881f16298d')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=$startdir/pkg/usr/share/man
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make prefix="${pkgdir}"/usr install
}