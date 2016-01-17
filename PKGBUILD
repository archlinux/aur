pkgname=dwm-custom
pkgver=0.1
pkgrel=1
pkgdesc="A helper for compiling dwm in userspace (default=6.1)"
url="https://git.framasoft.org/bobo/dwm-custom"
arch=('any')
license=('GPL3')
depends=('dwm' 'tar' 'sed' 'wget' 'patch')
source=("https://git.framasoft.org/bobo/dwm-custom/raw/master/snapshot/dwm-custom-0.1.tar.gz")
md5sums=('d879cddac01049a7e7ab3d0a2441a002')

prepare() {
  sed -i -e "s#DOCDIR=.*#DOCDIR=/usr/share/doc/$pkgname#" $srcdir/$pkgname-build
}

package() {
  install -m 755 -d $pkgdir/usr/bin
  install -m 755 -d $pkgdir/usr/share/xsessions
  install -m 755 -d $pkgdir/usr/share/doc/$pkgname
  cp -a $srcdir/$pkgname-build $pkgdir/usr/bin
  cp -a $srcdir/xsession/$pkgname-session $pkgdir/usr/bin
  cp -a $srcdir/xsession/$pkgname.desktop $pkgdir/usr/share/xsessions
  cp -a $srcdir/doc/* $pkgdir/usr/share/doc/$pkgname
}
