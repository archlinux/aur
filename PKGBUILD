# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# Contributor: Chjara Yebgui <tuxcrafting@cronut.cafe>

pkgname=fasmg
pkgver=l8vn
pkgrel=1
pkgdesc="Assembler with advanced macro-instruction abilities"
arch=('x86_64')
url='http://flatassembler.net/'
license=('BSD')
source=("https://flatassembler.net/$pkgname.$pkgver.zip")
noextract=("$pkgname.$pkgver.zip")
sha512sums=('010f9dd675884d73893e9e9dfd191e6fea39a74714d168cf18773d0d263f5eab07f2568a56550da02ad959520c948afffc459dfd936ac4a97fd3e8de3829fcd4')

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

