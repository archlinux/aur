# Maintainer: Martin Minka <martin.minka+arch@gmail.com>
# Contributor: Guy de Pourtalès <guy at gadp dot ch>
# Contributor: Martin Minka <martin.minka+arch@gmail.com>

pkgname=umongo
pkgver=1.6.2
_pkgver=1-6-2
pkgrel=1
pkgdesc="This package provides a GUI app that can browse and administer a MongoDB cluster"
arch=('any')
url="http://www.edgytech.com/umongo/"
license=('GPL')
depends=('java-runtime' 'bash')
provides=('umongo')
source=(https://s3.amazonaws.com/edgytech/umongo-linux-all_$_pkgver.zip $pkgname.sh $pkgname.png $pkgname.desktop)
md5sums=('08578467d5ff7851461f184dd68dfdb8'
         '9a060f5049875f2c7d174f6490185927'
         '4f2e531c9f804dcd389fc356d11d2687'
         '0c4db4a65e2455e7a73cc143b342e317')


package() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/{bin,share/{$pkgname,pixmaps,applications}}
  cp -R $srcdir/umongo-linux-all_$_pkgver/* $pkgdir/usr/share/$pkgname/
  install -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname.sh

  mkdir $pkgdir/usr/share/$pkgname/conf
  chmod 777 $pkgdir/usr/share/$pkgname/conf
  mkdir $pkgdir/usr/share/$pkgname/xml
  chmod 777 $pkgdir/usr/share/$pkgname/xml

  install -m644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  rm -f $pkgdir/usr/share/$pkgname/{*.zip,*.png,*.desktop}

}
