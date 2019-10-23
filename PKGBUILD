# Maintainer: Alessandro Toia <gort818@gmail.com>
pkgname=permrs
pkgver=0.1.0
pkgrel=1
pkgdesc='Utlity to save and restore unix permissions'
url='https://github.com/gort818/permrs'
makedepends=('rust' 'cargo')
arch=( 'x86_64')
source=("https://github.com/gort818/$pkgname/archive/v.$pkgver.tar.gz")
sha256sums=('82bd93f808e457dff53ec64026e945f2b490fd0ed8a58b08d6d190ff40a7b773')
build() {
    cd "$pkgname-v.$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-v.$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "${pkgdir}/usr/share/doc/${pkgname}"
    
}
