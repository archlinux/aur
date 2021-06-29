# Maintainer: Jozef Riha <jose1711@gmail.com

pkgname=pho
pkgver=1.0
pkgrel=1
pkgdesc="a lightweight image viewer"
url="http://www.shallowsky.com/software/pho/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gtk2')
source=(http://www.shallowsky.com/software/pho/$pkgname-${pkgver}.tar.gz)
md5sums=('d339b7d07c91e9b30572a901cfd5b3f2')

build() {
  cd $srcdir/$pkgname
  make
  gzip doc/pho.1
}

package() {
  cd $srcdir/$pkgname
  install -D -m755 pho $pkgdir/usr/bin/pho
  install -D -m644 doc/pho.1.gz $pkgdir/usr/share/man/man1/pho.1.gz
}
