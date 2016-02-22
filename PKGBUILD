# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=20kly
pkgver=1.4
pkgrel=1
pkgdesc="20'000 Light Years Into Space game"
arch=('any')
url="http://www.jwhitham.org/20kly/"
license=('GPL')
depends=('python2-pygame' 'glpk')
provides=('20kly')
source=("http://www.jwhitham.org/$pkgname/lightyears-$pkgver.tar.bz2"
        '0001-fix.patch')
md5sums=('1211f6c9f368e3d8053965b3e42dcdcd'
         '963cd97ab3b7f962069612e642a3dee5')

prepare() {
  cd "lightyears-$pkgver"
  patch -p1 -i $srcdir/0001-fix.patch
}

package() {
  cd "lightyears-$pkgver"

  mkdir -p ${pkgdir}/usr/share/20kly
  cp -r audio data code manual lightyears ${pkgdir}/usr/share/20kly

  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/share/20kly/lightyears ${pkgdir}/usr/bin/20kly
}
