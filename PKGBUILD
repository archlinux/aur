pkgname=foldertree
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast directory tree generator written in Rust"
arch=('x86_64')
url="https://github.com/Neuwj-00/Foldertree"
license=('GPL3')
depends=('xclip' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/ftr" "${pkgdir}/usr/bin/ftr"
}
