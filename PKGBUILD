# Maintainer: Tommy Falkowski <hello@byteowlz.com>
pkgname=byteowlz-tmpltr
pkgver=0.3.1
pkgrel=1
pkgdesc="Template-based document generation CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/tmpltr"
license=('MIT')
depends=('typst')
provides=('tmpltr')
conflicts=('tmpltr' 'tmpltr-bin')
makedepends=('rust' 'cargo')
source=("tmpltr-${pkgver}.tar.gz::https://github.com/byteowlz/tmpltr/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "tmpltr-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "tmpltr-${pkgver}"
    install -Dm755 target/release/tmpltr "${pkgdir}/usr/bin/tmpltr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
