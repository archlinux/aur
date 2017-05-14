# Maintainer:  ktamp <ktamp@chem.uoa.gr>
# Contributor: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dreamweb
pkgver=1.1
pkgrel=1
pkgdesc="A top-down adventure game set in a gritty futuristic dystopian city"
arch=('any')
url="https://en.wikipedia.org/wiki/DreamWeb"
license=('custom')
depends=('scummvm')
source=("http://downloads.sourceforge.net/scummvm/$pkgname-cd-uk-$pkgver.zip"
        "$pkgname.sh")
md5sums=('06ae54319977446a895753b226368830'
         '77dc4ba335a63e14324186d73cca0ffe')

package() {
  #Install documentation
  install -d $pkgdir/usr/share/doc/$pkgname/diary
  install -d $pkgdir/usr/share/doc/$pkgname/manual
  install -m644 $srcdir/diary/* $pkgdir/usr/share/doc/$pkgname/diary/
  install -m644 $srcdir/manual/* $pkgdir/usr/share/doc/$pkgname/manual/

  #Install license
  install -D -m644 $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt

  #Install binaries
  install -d $pkgdir/usr/share/$pkgname/speech
  install -m644 $srcdir/SPEECH/*.RAW $pkgdir/usr/share/$pkgname/speech/
  install -m644 $srcdir/DREAMWEB.* $pkgdir/usr/share/$pkgname/
  rm $pkgdir/usr/share/$pkgname/DREAMWEB.{EXE,WAV}
  install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
}
