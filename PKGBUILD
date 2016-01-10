pkgname=fictional-pancake
pkgdesc='A text adventure game'
pkgrel=1
pkgver=1.0
arch=('any')
license=('MIT')
url="https://github.com/$pkgname/$pkgname"
depends=('java-runtime-headless')
makedepends=('apache-ant')
source=(
    "https://github.com/$pkgname/$pkgname/archive/v$pkgver.zip"
    "https://vpzomtrrfrt.github.io/fpaur.sh"
    )
md5sums=(
    'SKIP'
    '3db8b6d98a064d92e0ffc0ca04f1afe2'
    )
package () {
    mkdir -p $pkgdir/usr/share/java/fictional-pancake
    mkdir -p $pkgdir/usr/bin
    install -Dm755 "$srcdir/fpaur.sh" "$pkgdir/usr/bin/fictional-pancake"
    cd $srcdir/$pkgname-$pkgver
    ant jar
    install -Dm755 apcsgame.jar $pkgdir/usr/share/java/fictional-pancake
}
