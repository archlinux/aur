# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=verus-bin
pkgver=0.2025.10.17.709c482
pkgrel=1
provides=('verus')
conflicts=('verus')
pkgdesc='Verified Rust for low-level systems code'
arch=('x86_64')
url='https://github.com/verus-lang/verus'
license=('MIT')
source=("$url/releases/download/release/$pkgver/verus-$pkgver-x86-linux.zip"
        "$url/raw/refs/heads/main/LICENSE")
sha256sums=('32d5343a451b8f540329b5be592587a84abfa317dbc2b9bafe3a221ed040338d'
            'ab78fc657425500bc64f617e36bb6819c6b0d039c573642f603dd594b12fe0d3')

package() {
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -a verus-x86-linux "$pkgdir/opt/verus"
    for bin in verus cargo-verus; do
        ln -s /opt/verus/$bin "$pkgdir/usr/bin/$bin"
    done
}
