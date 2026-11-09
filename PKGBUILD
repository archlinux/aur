# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=3.1.0
pkgrel=1
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("a888c04a302c90ab63e0c1fd676a7e198771c15930a9e27730276589a8e4a141")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("d863547c6256887fcb3299413072134af8fef389254ed948f0a1a4e2f9ffb823")

source_armv7h=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-armv7-unknown-linux-gnueabihf.tar.xz")
sha256sums_armv7h=("5f91f5d488ecf744dd25b3f1081128dc1463845df359ac714f241ebd74d813bb")

package () {
    cd "minijinja-cli-$CARCH-unknown-linux-gnu"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
