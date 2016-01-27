pkgname=dwm-custom
pkgver=0.2
pkgrel=1
pkgdesc="A helper for compiling dwm in userspace (default=6.1)"
url="https://git.framasoft.org/bobo/dwm-custom"
arch=('any')
license=('GPL3')
depends=('dwm' 'tar' 'sed' 'wget' 'patch')
source=("https://git.framasoft.org/bobo/dwm-custom/raw/master/snapshot/dwm-custom-$pkgver.tar.gz")
md5sums=('b9a94794dd29d7382853e619019cf892')

prepare() {
  sed -i -e "s:DOCDIR=.*:DOCDIR=/usr/share/doc/$pkgname:" $srcdir/$pkgname-build
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
