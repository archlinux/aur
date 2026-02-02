# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=xwin-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=(x86_64 aarch64)
url='https://github.com/Jake-Shadle/xwin'
license=(Apache MIT)
source_x86_64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=(f1bffe5319728fca9cde5bb03fcb6c88cdf44922bd003fca8b4b9ce5b6f259d2)
sha256sums_aarch64=(b85cd1e0c94f249338b02a6e54b380154a5af6b5dd754121b15722125a67cf9f)

package() {
    cd "$srcdir/xwin-$pkgver-$CARCH-unknown-linux-musl"
    install -Dm755 -t "$pkgdir/usr/bin" ./xwin
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICENSE-*
}
