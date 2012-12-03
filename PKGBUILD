# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=fatattr
pkgver=1.0.1
pkgrel=4
pkgdesc="Display or change attributes on a FAT filesystem"
arch=('i686' 'x86_64')
url="http://kernel.org/pub/linux/utils/fs/fat/fatattr/"
license=('GPL')
depends=('glibc')
changelog='ChangeLog'
source=(http://ftp.us.debian.org/debian/pool/main/f/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz)
sha256sums=('2dd7208dc259118dffa761ebd9ea509de635578b57cb871f836aa8dd66651d11')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make INSTALLROOT=$pkgdir install
}

# vim:set ts=2 sw=2 et:
