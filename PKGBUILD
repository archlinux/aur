# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Hyperair <hyperair@gmail.com>

pkgname=wakeonlan
pkgver=0.41
pkgrel=4
pkgdesc="Utility for waking up computers using UDP Wake-on-Lan packets"
arch=('any')
url="http://gsd.di.uminho.pt/jpo/software/wakeonlan/"
license=('GPL')
depends=('perl')
source=("ftp://ftp.hu.debian.org/pub/linux/distributions/frugalware/frugalware-current/source/network-extra/wakeonlan/wakeonlan-$pkgver.tar.gz")
md5sums=('d3143c5fe92d16196ac853b55dd421b5')
options=(docs)

build() {
  cd $srcdir/$pkgname-$pkgver
  perl Makefile.PL
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m0755 $pkgname $pkgdir/usr/bin/$pkgname
  install -D -m0644 blib/man1/$pkgname.1p $pkgdir/usr/share/man/man1p/$pkgname.1p
  find examples -exec install -D -m0644 '{}' $pkgdir/usr/share/doc/$pkgname/\{\} \;
}
