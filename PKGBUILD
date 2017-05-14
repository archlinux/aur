# Maintainer: ktamp <ktamp@chem.uoa.gr>

pkgname=sword25
pkgver=1.0
pkgrel=1
pkgdesc='"Broken Sword 2.5: The Return of the Templars" is a graphical point-and-click adventure game'
arch=('any')
url="http://www.brokensword25.com/"
license=('custom')
depends=('scummvm')
source=("http://downloads.sourceforge.net/scummvm/$pkgname-v$pkgver.zip"
        "$pkgname.sh")
md5sums=('cd1957e836e66279ad4b7ba799f022a9'
         'a4d9d1d1e11ee27ecf4642685af6447b')

package() {
  #Install documentation
  install -D -m644 $srcdir/README $pkgdir/usr/share/doc/$pkgname/README

  #Install licenses
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 $srcdir/license-* $pkgdir/usr/share/licenses/$pkgname/

  #Install binaries
  install -D -m644 $srcdir/data.b25c $pkgdir/usr/share/$pkgname/data.b25c
  install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
}
