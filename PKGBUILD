# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.8.0
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
sha256sums_x86_64=("4c9d3d628644a5b2b280c9a3b71187b33d22a1dfd6664d86fd27eeb702d0c7b8")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums_aarch64=("2691ddcd2c4a9d7f2a3db66448067d050c84e293e2cdaeadbdfe4ab319ef8a5c")

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
