# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=rcodesign-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Pure Rust Apple code signing and notarization tool"
arch=('x86_64')
url="https://github.com/indygreg/apple-platform-rs"
license=('MPL-2.0')
options=('!debug')
provides=('rcodesign')
conflicts=('rcodesign')
source=("apple-codesign-${pkgver}-x86_64-unknown-linux-musl.tar.gz::${url}/releases/download/apple-codesign/${pkgver}/apple-codesign-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('dbe85cedd8ee4217b64e9a0e4c2aef92ab8bcaaa41f20bde99781ff02e600002')

package() {
    cd "apple-codesign-${pkgver}-x86_64-unknown-linux-musl"
    install -Dm755 rcodesign "$pkgdir/usr/bin/rcodesign"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
