# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

_pkgname=binutils
_target=mipsel-linux
pkgname=$_target-$_pkgname
pkgver=2.34
pkgrel=1
pkgdesc="mipsel-linux binary manipulation programs"
url="https://www.gnu.org/software/$_pkgname/"
depends=(glibc)
arch=('x86_64' 'i686')
license=(GPL)
source=(ftp://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.bz2)
sha256sums=('89f010078b6cf69c23c27897d686055ab89b198dddf819efb0a4f2c38a0b36e6')

build() {
  cd $srcdir/$_pkgname-$pkgver

  ./configure --target=$_target --prefix=/usr
  make
}
package() {
  make prefix=${pkgdir}/usr install
  # Remove unwanted files
  rm -rf ${pkgdir}/usr/share
}
