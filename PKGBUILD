# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.11.0
pkgrel=1
pkgdesc="Command-line utility for the MiniJinja template engine"
arch=(x86_64 aarch64)
url="https://github.com/mitsuhiko/minijinja"
license=(MIT)
depends=(glibc)
provides=(minijinja-cli)
conflicts=(minijinja-cli)
_archive="minijinja-cli-$CARCH-unknown-linux-gnu"

source_x86_64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums_x86_64=("08c739a059edb025ad8b724d35531f12c9df56664f39070100c7475715450522")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums_aarch64=("eaf1b2526b1b25c74b43b591ec5e399b80893fef78ed29e6cad4a9899fa03a62")

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
