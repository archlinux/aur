# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verus-bin
pkgver=0.2026.07.18.3a4d30b
pkgrel=1
provides=('verus')
conflicts=('verus')
pkgdesc='Verified Rust for low-level systems code'
arch=('x86_64')
url='https://github.com/verus-lang/verus'
license=('MIT')
source=("$url/releases/download/release/$pkgver/verus-$pkgver-x86-linux.zip"
        "$url/raw/refs/heads/main/LICENSE")
sha256sums=('7097a91ea4bf5896a418d90743626cbe5c085ce5ef8a64ed8d84c0aa5e49ac55'
            'ab78fc657425500bc64f617e36bb6819c6b0d039c573642f603dd594b12fe0d3')

package() {
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -a verus-x86-linux "$pkgdir/opt/verus"
    for bin in verus cargo-verus; do
        ln -s /opt/verus/$bin "$pkgdir/usr/bin/$bin"
    done
}
