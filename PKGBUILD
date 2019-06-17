pkgname=fictional-pancake
pkgdesc='A text adventure game'
pkgrel=2
pkgver=1.0
arch=('any')
license=('MIT')
url="https://github.com/fictional-pancake/$pkgname"
depends=('java-runtime-headless')
makedepends=('apache-ant')
source=(
    "https://github.com/fictional-pancake/$pkgname/archive/v$pkgver.zip"
    "fpaur.sh"
)
sha256sums=('25cef4bc263d9e32b211218c4ff0e0c5a3446409fdd8f1af4e16131107b705bc'
            '2ab290abb981786b048953d67a64602a4f4e84280669ba16d9fc9f6e6ae51e63')

package() {
    mkdir -p $pkgdir/usr/share/java/fictional-pancake
    mkdir -p $pkgdir/usr/bin
    install -Dm755 "$srcdir/fpaur.sh" "$pkgdir/usr/bin/fictional-pancake"
    cd $srcdir/$pkgname-$pkgver
    ant jar
    install -Dm755 apcsgame.jar $pkgdir/usr/share/java/fictional-pancake
}
