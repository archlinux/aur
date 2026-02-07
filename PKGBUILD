# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=xwin-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=(x86_64 aarch64)
url='https://github.com/Jake-Shadle/xwin'
license=(Apache MIT)
provides=(xwin)
conflicts=(xwin)
source_x86_64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=(8a354e12475dd154d0a2d3084eefd2c105f872ec8062965baaa7e9f2f76fe611)
sha256sums_aarch64=(fe106caefbb316664d73fd03166c28c09e580bb2a3ad65b4d50c51c67368aeab)

package() {
    cd "$srcdir/xwin-$pkgver-$CARCH-unknown-linux-musl"
    install -Dm755 -t "$pkgdir/usr/bin" ./xwin
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICENSE-*
}
