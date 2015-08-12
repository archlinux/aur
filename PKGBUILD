# Contributor: btg <btgunes at gmail dot com>

pkgname=hunspell-tr
pkgver=0.1
pkgrel=4
pkgdesc="Turkish Dictionary for Hunspell"
arch=('any')
url="http://tr-spell.googlecode.com/"
license=('LGPL' 'BSD')
depends=('hunspell')
source=(http://tr-spell.googlecode.com/files/Hunspell_tr_TR_v.0.1.zip)
md5sums=('774eae07421f2823898a2a423245b472')

package() {
  cd $srcdir
  install -D -m644 tr.dic $pkgdir/usr/share/hunspell/tr_TR.dic
  install -D -m644 tr.aff $pkgdir/usr/share/hunspell/tr_TR.aff
  install -D -m644 README $pkgdir/usr/share/doc/hunspell-tr/README
  install -dm755 ${pkgdir}/usr/share/myspell/dicts  
  pushd $pkgdir/usr/share/myspell/dicts
  for file in $pkgdir/usr/share/hunspell/*; do
   ln -sv /usr/share/hunspell/$(basename $file) .
  done
}  
