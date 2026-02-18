# Maintainer: byteowlz
pkgname=tmz
pkgver=0.2.1
pkgrel=1
pkgdesc="Microsoft Teams from the terminal"
arch=('x86_64')
url="https://github.com/byteowlz/tmz"
license=('MIT')
depends=('gcc-libs' 'nodejs')
optdepends=('npm: for installing playwright for browser-based auth')
source=("$pkgname-$pkgver.tar.gz::https://github.com/byteowlz/tmz/releases/download/v$pkgver/tmz-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('23fe9f6abfafbf939a693e1d2f2e5c89f9e6c0c7f419cdd1a5c05d36ccea576b')

package() {
    cd "$pkgname-v$pkgver-x86_64-unknown-linux-gnu"
    install -Dm755 tmz "$pkgdir/usr/bin/tmz"
    install -Dm644 teams-auth.mjs "$pkgdir/usr/share/tmz/teams-auth.mjs"
}
