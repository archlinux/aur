# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-window
pkgver=0.1.0
pkgrel=1
pkgdesc="window daemon for kime"
url="https://github.com/Riey/kime-window"
conflicts=('kime-window')
provides=('kime-window')
depends=('libappindicator-gtk3'
         'gtk3')
makedepends=('cargo' 'clang' 'llvm' 'libappindicator-gtk3' 'gtk3' 'unicode-cldr-annotations')
arch=('any')
license=('GPL3')
source=(
    ${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz"
)
md5sums=('2fba6f3d57262fd51206fb5f416efaa6')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -s ./target/release/kime-window -t "${pkgdir}/usr/bin"
}

