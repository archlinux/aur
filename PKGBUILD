# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# Contributor: Chjara Yebgui <tuxcrafting@cronut.cafe>

pkgname=fasmg
pkgver=kd3c
pkgrel=1
pkgdesc="Assembler with advanced macro-instruction abilities"
arch=('x86_64')
url='http://flatassembler.net/'
license=('BSD')
source=("https://flatassembler.net/$pkgname.$pkgver.zip")
noextract=("$pkgname.$pkgver.zip")
sha512sums=('54d3fa2ffde1d6137b419b880049d4a55704c46b905bd396c8372078b4ddfee9beb3b46443401ef4e2c3319915c6d2729d5fb9d02b5fdd4f35ada384ad2a91e5')
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

