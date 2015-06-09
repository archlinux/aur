# Maintainer: FzerorubigD <fzerorubigd {AT} Gmail {Dot} Com

pkgname=suspended-sentence
pkgver=1.0.1
pkgrel=2
pkgdesc="A game about incarceration and duct tape, by Simon Cross, Neil Muller, Adrianna Pińska, Stefano Rivera and Jeremy Thurgood."
url="http://suspended-sentence.org/"
arch=('any')
license=('unknown')
depends=('python2' 'python2-pygame')
source=(https://suspended-sentence.org/releases/${pkgver}/${pkgname}-${pkgver}.tgz
        "Suspended Sentence.desktop"
        "suspended-sentence.sh")
md5sums=('97e2d13847ed0ec71ca9c8c95294479e'
         'd5b759a2b3b3966aa516b20b99427c50'
         '802a48ebfc653d43d0acd948ad677c78')

package() {
  mkdir $pkgdir/{opt,usr,usr/{bin,share,share/{pixmaps,applications}}}
  cd $srcdir
  cp -R $srcdir/suspended-sentence $pkgdir/opt
  install -m755 $srcdir/suspended-sentence.sh $pkgdir/usr/bin/suspended-sentence
  install -m644 $srcdir/$pkgname/Resources/icons/suspended_sentence128x128.png $pkgdir/usr/share/pixmaps/
  mv $pkgdir/usr/share/pixmaps/suspended_sentence128x128.png $pkgdir/usr/share/pixmaps/suspended_sentence.png
  install -m644 "$srcdir/Suspended Sentence.desktop" $pkgdir/usr/share/applications
}

