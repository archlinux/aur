# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandros McCray <alexandros at amccray dot com>

pkgname=runa-bin
_name=runa
pkgver=0.15.4
pkgrel=1
pkgdesc="A fast and lightweight terminal file manager written in Rust"
arch=(x86_64 aarch64)
url="https://github.com/runa-fm/runa"
license=('Apache-2.0 OR MIT')
depends=(libgcc)
provides=(runa)
conflicts=(runa)
changelog=CHANGELOG.md
source_x86_64=("$pkgname-$pkgver-x86_64-gnu.tar.gz::$url/releases/download/v$pkgver/runa-linux-x86_64-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-gnu.tar.gz::$url/releases/download/v$pkgver/runa-linux-aarch64-gnu.tar.gz")
sha256sums_x86_64=('a99d2207773fdbf782d39440720587877987bc3557213512b9122c07493ea88c')
sha256sums_aarch64=('7b6701721a91b8b366d8d9fc8c9108d61d89a307dadf67bab7d64583ffd715b4')

package() {
    cd "runa-linux-$CARCH-gnu"
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 docs/config-reference/{display,editor,general,keys,theme,commands}.md -t "$pkgdir/usr/share/doc/$pkgname/config-reference/"
}

