# Maintainer: Chjara Yebgui <tuxcrafting@cronut.cafe>
pkgname=fasmg
pkgver=jmhx
pkgrel=2
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
sha512sums=('e77d44f62936a30adf88107f8cda8c74261697909221ec98968fc3cf94409e7bb81c1dcd59f6e528636686eb63de1428326271ab42410ca38b022432c7e3ab1a')
validpgpkeys=()

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
