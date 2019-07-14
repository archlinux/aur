# Contributor: Oin <mapleoin@nerdshack.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de

pkgname=sisc
pkgver=1.16.6
pkgrel=5
pkgdesc="Second Interpreter of Scheme Code"
arch=('any')
url="http://sisc.sourceforge.net/"
depends=('java-runtime' 'rlwrap')
license=('MPL' 'GPL2')
install=$pkgname.install
source=("$pkgname.sh" "http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7067d7ccc20c7dabbd5b546c075e0e114a681bdd82686f8e96efc13c1f507b0c'
            '65e15ac81d96e97de3ecabd409b3d2bc9307e624f46908d9f74047175c527ecf')
conflicts=('gambit-c')

package() {
    cd $pkgname-$pkgver/
    install -d "$pkgdir"/usr/bin
    yes "" | ./install-srfi22.sh "$pkgdir"/usr/bin
    install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
    install -d "$pkgdir"/usr/share/java/$pkgname
    cp -r "$srcdir"/$pkgname-$pkgver/*.jar $pkgname.shp "$pkgdir"/usr/share/java/$pkgname
}
