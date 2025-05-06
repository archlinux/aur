# Maintainer: Pierre Chapuis <arch@catwell.info>

pkgname="minijinja-cli-bin"
pkgver=2.10.2
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
sha256sums_x86_64=("690c7f074a22ccc470746c215c40c41bc31d6214292ad4d24055ecd5b75732f2")

source_aarch64=("$pkgname-$pkgver.src.tar.xz::$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums_aarch64=("be0bd7219250b0b66d93fb72340624b6d1468623b8853f33d9b6a202cb425932")

package () {
    cd "$_archive"
    install -Dm0755 minijinja-cli "$pkgdir/usr/bin/minijinja-cli"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
