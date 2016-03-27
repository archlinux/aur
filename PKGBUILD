# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=tokei
pkgver=1.5.0
pkgrel=1
pkgdesc='A blazingly fast CLOC(Count Lines Of Code) program'
arch=('i686' 'x86_64')
url="https://github.com/Aaronepower/tokei"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("https://github.com/Aaronepower/tokei/archive/1.5.0.tar.gz")
md5sums=('d011a08e0b0bfb3fbcd4eb99c21cfca8')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/release/tokei "${pkgdir}/usr/bin/tokei"
}
