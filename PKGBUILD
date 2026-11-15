# Maintainer: Vyacheslav Darnitsyn <v@darnitsyn.ru>
pkgname=florarium
pkgver=1.0.0
pkgrel=1
pkgdesc="Fullscreen terminal gallery of ASCII flowers in vases and pots"
arch=('x86_64' 'aarch64')
url="https://github.com/6e6f303216/florarium"
license=('MIT')
depends=('coreutils')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1b9612830341f1cd8d733caa6926de98609033fab744480e06b16faea891ee5')

build() {
    cd "$pkgname-$pkgver"
    rustc florarium.rs -C opt-level=3 -C strip=symbols -o florarium
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 florarium "$pkgdir/usr/bin/florarium"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
