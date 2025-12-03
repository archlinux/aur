# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.13.0
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
sha256sums_x86_64=("d8c74a5d57f063995232735d949cad47e4d08971a38d4a922321113bc7db6a6b")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums_aarch64=("2feec7c42a503b9595f4a9ff499428a39cce450d665e5ab3f51b0625e20553cf")

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
