# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=zuu
pkgver=5.0.6
pkgrel=1
pkgdesc="A git hook test runner for rust programer" 
provides=("zuu")
arch=('any')
url="https://github.com/taishingi/zuu"
license=('GPL3')
depends=('rustup' 'wget' 'git')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ccd14124a983117b416cb1e9a2d2fa7eb6676adcdfe8662b7de34abd98e3d75e')

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
