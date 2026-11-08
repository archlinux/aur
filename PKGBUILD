# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexandros McCray <alexandros at amccray dot com>

pkgname=runa-bin
_name=runa
pkgver=0.15.2
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
sha256sums_x86_64=('1321509513c12b073ce93097355fd8ee7f3f757091e02d6f0507a64951c27105')
sha256sums_aarch64=('fd5b9497b574dfbfcd503b0838d6da5cee9c81d2e171d8f86ade5d7aebafb6be')

package() {
    cd "runa-linux-$CARCH-gnu"
    install -Dm755 rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 docs/config-reference/{display,editor,general,keys,theme,commands}.md -t "$pkgdir/usr/share/doc/$pkgname/config-reference/"
}

