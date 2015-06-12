# Maintainer: Jozef Riha <jose1711@gmail.com

pkgname=pho
pkgver=0.9.8
pkgrel=2
pkgdesc="a lightweight image viewer"
url="http://www.shallowsky.com/software/pho/"
license=("GPL-2")
arch=('i686' 'x86_64')
depends=('gtk2')
source=(http://www.shallowsky.com/software/pho/$pkgname-${pkgver}.tar.gz)
md5sums=('7de71d1723c5bfec0efb2d6cf79a3df5')

build() {
  cd $srcdir/$pkgname
  make
  gzip pho.1
}

package() {
  cd $srcdir/$pkgname
  install -D -m755 pho $pkgdir/usr/bin/pho
  install -D -m644 pho.1.gz $pkgdir/usr/share/man/man1/pho.1.gz
}
