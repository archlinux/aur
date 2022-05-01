# Maintainer: Chjara Yebgui <tuxcrafting@airmail.cc>
pkgname=fasmg
pkgver=jmhx
pkgrel=1
epoch=
pkgdesc="Assembler with advanced macro-instruction abilities"
arch=('x86_64')
url='http://flatassembler.net/'
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://flatassembler.net/$pkgname.$pkgver.zip")
noextract=("$pkgname.$pkgver.zip")
sha512sums=('321f8214ba06b1ae7bed3ba6368ee45105dad6f651f8b9197b0e7f9d74368b1922797747690ed22190ee6b5aed6850885fb7ee269cb9c1d65d18d8f71cb72a8a')
validpgpkeys=()

prepare() {
    [ -d "$pkgname-$pkgver" ] || mkdir "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    bsdtar xf "../$pkgname.$pkgver.zip"
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/fasmg"
    cp fasmg.x64 "$pkgdir/usr/bin/fasmg"
    chmod +x "$pkgdir/usr/bin/fasmg"
    cp -r docs/* examples "$pkgdir/usr/share/doc/fasmg"
}
