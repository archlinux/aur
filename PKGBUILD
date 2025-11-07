# Maintainer: preclik02
pkgname=scrap-game
pkgver=1.1
pkgrel=1
pkgdesc="Small CLI game where you collect scrap and buy stars"
arch=('x86_64')
url="https://github.com/Preclik02/scrap_game"
license=('0BSD')
depends=('bash' 'gcc' 'curl')
makedepends=('git')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/scrap_game-$pkgver"

    # Compile the game with curl library
    gcc scrap.c -o scrap-game -lcurl
}

package() {
    cd "$srcdir/scrap_game-$pkgver"

    # Install the compiled binary into /usr/bin
    install -Dm755 scrap-game "$pkgdir/usr/bin/scrap-game"

    # Install the LICENSE file
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


    # Optional: copy source files to /usr/share/scrap-game for reference
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r ./* "$pkgdir/usr/share/$pkgname/"
}
