# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=bml
pkgver=0.8.0
pkgrel=1
pkgdesc="Buzztrax machine loader (former Buzztard)"
arch=('i686' 'x86_64')
url="http://www.buzztrax.org/"
license=('LGPL')
source=("http://downloads.sourceforge.net/buzztard/buzz%20machine%20loader/bml-$pkgver.tar.gz")
md5sums=('707c78c8b029701a48f770256ad6f662')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
