# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=xwin-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=(x86_64 aarch64)
url='https://github.com/Jake-Shadle/xwin'
license=(Apache MIT)
provides=(xwin)
conflicts=(xwin)
source_x86_64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=(31e1033f30608ba6b821d17f1461042bd54c23424813c9b4e9ae15b6d32fa4cd)
sha256sums_aarch64=(41466ca41e16fe7fc1b82a67babc7c3811021bf32de354b90b34d8c4edb153e2)

package() {
    cd "$srcdir/xwin-$pkgver-$CARCH-unknown-linux-musl"
    install -Dm755 -t "$pkgdir/usr/bin" ./xwin
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICENSE-*
}
