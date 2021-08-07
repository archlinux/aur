# Maintainer: Mario Jiménez <mario.emilio.j@gmail.com>

# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=fuzzy-pdf
pkgver=0.3.6
pkgrel=1
pkgdesc='Fuzzy finder for a collection of pdf files'
arch=('x86_64')
url='https://github.com/MarioJim/fuzzy-pdf'
license=('GPL3')
depends=('poppler-glib')
makedepends=('cargo')
provides=('fuzzy-pdf')
conflicts=('fuzzy-pdf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('75bb134ff05a040d8a896f99e9dcb7f8714e7863562508d4abb79a648d3c3792')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --target-dir "target/"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
