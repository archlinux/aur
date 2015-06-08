# Maintainer: strubbisch <becker.frank.77@googlemail.com>
# Contributor: Frank Becker <becker.frank.77@googlemail.com>
pkgname=abtransfers
pkgver=0.0.5.0
pkgrel=2
pkgdesc="A program to perform HBCI-Transfers with aqbanking"
arch=(i686 x86_64)
url="http://schmufu.dyndns.org/dokuwiki/ab_transfer:start"
license=('GPL')
depends=('qt4' 'aqbanking')
source=(http://schmufu.dyndns.org/abtransfers/source/$pkgname-$pkgver.tar.bz2
	$pkgname.desktop
	abtransfers.pro)

build() {
  cp abtransfers.pro $srcdir/$pkgname-$pkgver
  cd $srcdir/$pkgname-$pkgver
  qmake-qt4
  make
}
package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/$pkgname/icon
  mkdir -p $pkgdir/usr/share/applications
  cd $srcdir/$pkgname-$pkgver/build
  install -m755 abtransfers $pkgdir/usr/bin/
  cd $srcdir/$pkgname-$pkgver/images
  install -m644 bank_transfer_128x128.png $pkgdir/usr/share/$pkgname/icon/icon.png
  cd $srcdir
  install -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
md5sums=('bc38d7ee81f1d0456872c384f2890cd8'
         '5ef91bc33a3d58984a61e7143fe6f925'
         'bc9a5bcd3a3883b7bb299ccc17bc77c6')
sha1sums=('90163670a917d8e2476151450f42863c0e56ed8d'
          'd092c551475591fdb7d7801d1f09d193c1f85b31'
          '679aae779f1dbe932c62cdb7e2dd4bbde612ade3')
sha512sums=('b7c2ec6e6f41cf44bfea4e3a8e005a65f0632889a177f7ad51b75fce668606b3cca009ed8c55e9b55f7181617eded993626e5f580a2fc49928eedc5b974711e4'
            'e873695b03c5d9a722a948c982dbd6a94bdd65099707e44f8bed231a85b342f7b5f900e44c42a9bd2cb1aebec23964917788722589e9a6ed6ba0a467b093d5a3'
            'f8f22ecb620e35eb00b9c667779652fba5a48b3b8ed9d0eb03f74949f25aa3ece72c08e8b6de72224b97afecd55c250a9ef8731bc36c5202344743d1a7e7903b')
