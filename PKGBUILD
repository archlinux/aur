# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: dracorp
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 18/03/2011
pkgname=autopanogiga
pkgver=3.7.1
_ver=371_2014-12-09
pkgrel=1
pkgdesc='The program for creating panoramic images (trial version).'
arch=('x86_64')
url='http://kolor.com/'
license=('custom: "commercial"')
depends=("qt4")
install=autopanogiga.install
changelog=ChangeLog
_archivename=AutopanoGiga_Linux64_$_ver.tar.gz
source=(
  "$_archivename::http://download.kolor.com/apg/stable/linux64tar"
  "$pkgname"
  "$pkgname.desktop"
)
md5sums=('ab8af573e15e69b5e8e4619390c8ef37'
         '60b7358a58c528a1e3589a82f2835bf5'
         'f5c58397f9d2df59c5fc7ee0db2f73af')

package(){
  cd "$srcdir/$_pkgname"
  install -dm755 $pkgdir/{opt/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoGiga $pkgdir/opt/$pkgname
  mv $pkgdir/opt/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
