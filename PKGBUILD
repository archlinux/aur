# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.19.0
pkgrel=2
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=("2b07e18b53c2ebf5574e68784b3e510478678621b7d1d6bafe49cdb721ed9961")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=("134bb873e291d220e1e67624610a667108a72c4b72ec65eb338e500bc510b4e8")

source_armv7h=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/minijinja-cli-armv7-unknown-linux-gnueabihf.tar.xz")
sha256sums_armv7h=("e8aeb3580e3afdb5ec0ba2a49416ae4856197a712d0565377b658494d5586269")

package () {
    cd "minijinja-cli-$CARCH-unknown-linux-gnu"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
