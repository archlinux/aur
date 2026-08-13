# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=xwin-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Allows downloading and repacking the MSVC CRT and Windows SDK for cross compilation'
arch=(x86_64 aarch64)
url='https://github.com/Jake-Shadle/xwin'
license=(Apache MIT)
provides=(xwin)
conflicts=(xwin)
source_x86_64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/Jake-Shadle/xwin/releases/download/$pkgver/xwin-$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=(d870eb4b2f390878af6da1ccd3cf321d22fcb72720984853b4be732ae597fc88)
sha256sums_aarch64=(6d56d28537a86f37aa3d041318898f25ee3100c6b6ec332ad873c28faf37be23)

package() {
    cd "$srcdir/xwin-$pkgver-$CARCH-unknown-linux-musl"
    install -Dm755 -t "$pkgdir/usr/bin" ./xwin
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./LICENSE-*
}
