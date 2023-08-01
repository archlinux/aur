# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Martin Striz <ms@poruba.net>

pkgname=logapp
pkgver=0.16
pkgrel=1
pkgdesc="Text output coloring utility"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/logapp"
license=('GPL')
depends=(glibc)
#source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)


build(){
  cd $srcdir/$pkgname-$pkgver
  make
}
package(){
  cd $srcdir/$pkgname-$pkgver
  install -dm755 $pkgdir/usr/bin
  make PREFIX=$pkgdir/usr/ install
  make PREFIX=$pkgdir/usr/ install_links
  install -D -m0644 example.conf $pkgdir/etc/logapp/example.conf
}
sha256sums=('bb3eaa997d85a69c7e8c038d1d2c4daade15dad2bb22ee70567c0d8f3a631742')
