# Maintainer: Alice Vega <aalicevegaa at proton mail dot com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: libernux <dutchman55@gmx.com>
pkgname=wmcalc
pkgver=0.7
pkgrel=1
pkgdesc="Dockapp that performs all the functions of a simple four function calculator"
arch=('i686' 'x86_64')
url="https://www.dockapps.net/wmcalc"
license=('GPL')
groups=('x11')
depends=('libxpm')
source=("https://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('1ccc2515828f2cfdec8e5be0e9f996c6')

prepare() {
  cd $pkgname-$pkgver
  ./configure
}
build() {
  cd $pkgname-$pkgver
  make
}
package() {
  cd $pkgname-$pkgver
  install -m 755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -m 755 -D "$pkgname.conf" "$pkgdir/usr/local/etc/$pkgname.conf"

  if [[ -f "README" ]]; then
	install -m 644 -D "README" "$pkgdir/usr/share/doc/$pkgname/README"
  fi
    
  if [[ -f "CHANGES" ]]; then
	install -m 644 -D "CHANGES" "$pkgdir/usr/share/doc/$pkgname/CHANGES"
  fi
    
  if [[ -f "COPYING" ]]; then
	install -m 644 -D "COPYING" "$pkgdir/usr/share/doc/$pkgname/COPYING"
  fi
}
