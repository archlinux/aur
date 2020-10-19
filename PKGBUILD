# Maintainer: Mario Jiménez <mario.emilio.j@gmail.com>

# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=fuzzy-pdf
pkgver=0.3.2
pkgrel=1
pkgdesc='Fuzzy finder for a collection of pdf files'
arch=('x86_64')
url='https://github.com/MarioJim/fuzzy-pdf'
license=('GPL3')
depends=('poppler-glib')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7be91edeba3de9183b791d41e6afb5958dc86fa890361c2cb89da0b57e0661f0')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --target-dir "target/"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
