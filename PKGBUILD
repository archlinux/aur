# Maintainer: desbma
pkgname=zoxide
pkgver=0.3.1
pkgrel=1
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${pkgname}"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ajeetdsouza/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('10ccd67cac850715566032b9aab7e2ce3e94cd235fac08fc314dd856458a0a23cae1e85751d575c03307e3a1033092abc73c24fa0396f28eb2cc844acbccc194')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
