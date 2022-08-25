pkgbase=calc
pkgname=coriolinus-${pkgbase}
pkgver=0.4.0
pkgrel=1
pkgdesc='Rust command line calculator'
url="https://github.com/coriolinus/${pkgbase}"
arch=('x86_64')
license=('GPL3')
makedepends=('rust')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1162441f3e9bd5fc86aa6c61f64ad8f7b5b679ab89275afce6fd7b0e99c7f3f7')

build() {
    cd "${pkgbase}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd "${pkgbase}-${pkgver}"
    install -Dm 755 target/release/${pkgbase} -t ${pkgdir}/usr/bin
    install -Dm 644 README.md CHANGELOG.md -t ${pkgdir}/usr/share/doc/${pkgname}
}
