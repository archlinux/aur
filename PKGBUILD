# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: dracorp
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 18/03/2011
pkgname=autopanogiga
pkgver=4.2.3
_ver=400
pkgrel=2
pkgdesc='The program for creating panoramic images (trial version).'
arch=('x86_64')
url='http://kolor.com/'
license=('custom: "commercial"')
depends=("qt5-multimedia")
install=autopanogiga.install
changelog=ChangeLog
_archivename=AutopanoGiga_Linux64_${pkgver}.tar.gz
source=(
  "$_archivename::http://download.kolor.com/apg/stable/linux64tar/${pkgver}.${_ver}"
  "$pkgname"
  "$pkgname.desktop"
)
md5sums=('23c46e39957c9d23701cd83e96793914'
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
