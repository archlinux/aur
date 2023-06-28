# Contributor: Chjara Yebgui <tuxcrafting@cronut.cafe>

pkgname=fasmg
pkgver=k328
pkgrel=2
pkgdesc="Assembler with advanced macro-instruction abilities"
arch=('x86_64')
url='http://flatassembler.net/'
license=('BSD')
options=(!strip)
source=("https://flatassembler.net/$pkgname.$pkgver.zip")
noextract=("$pkgname.$pkgver.zip")
sha512sums=('30b3ba34cefa997d979e10ef558016c8c9320b3392f959554f5384e27c38ca5b893784985d418e297f297e758865847a70fa9b68a2043de621a3ad7fba715475')


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
