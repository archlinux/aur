# Contributor: Oin <mapleoin@nerdshack.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de

pkgname=sisc
pkgver=1.16.6
pkgrel=4
pkgdesc="Second Interpreter of Scheme Code"
arch=('any')
url="http://sisc.sourceforge.net/"
depends=('java-runtime' 'rlwrap')
license=('MPL' 'GPL2')
install=$pkgname.install
source=("$pkgname.sh" "http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9eae341d76de1bf5cc463dfa23242cfb'
         '15f2aa0c08b782d7882aa884846b902e')

package() {
    cd $srcdir/$pkgname-$pkgver/
    install -d $pkgdir/usr/bin
    yes "" | ./install-srfi22.sh $pkgdir/usr/bin
    install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -d $pkgdir/usr/share/java/$pkgname
    cp -r $srcdir/$pkgname-$pkgver/*.jar $pkgname.shp $pkgdir/usr/share/java/$pkgname
}
