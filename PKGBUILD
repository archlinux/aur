# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# Contributor: Chjara Yebgui <tuxcrafting@cronut.cafe>

pkgname=fasmg
pkgver=kp60
pkgrel=1
pkgdesc="Assembler with advanced macro-instruction abilities"
arch=('x86_64')
url='http://flatassembler.net/'
license=('BSD')
source=("https://flatassembler.net/$pkgname.$pkgver.zip")
noextract=("$pkgname.$pkgver.zip")
sha512sums=('69e7b591497c123403f3c6bede72eefcfdcae2d784baf131c81291a1f8e1949019042c26abc52c169cb842177abd2294a47b3056d61b9ecdd5c1d2ecb246adf6')

prepare() {
    [ -d "$pkgname-$pkgver" ] || mkdir "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    bsdtar xf "../$pkgname.$pkgver.zip"
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
    cp fasmg.x64 "$pkgdir/usr/bin/fasmg"
    chmod +x "$pkgdir/usr/bin/fasmg"
    cp -r docs/* examples "$pkgdir/usr/share/doc/$pkgname"
    cp license.txt "$pkgdir/usr/share/licenses/$pkgname"
}

