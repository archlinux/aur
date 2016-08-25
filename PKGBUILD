# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=tokei
pkgver=4.2.0
pkgrel=1
pkgdesc='A blazingly fast CLOC(Count Lines Of Code) program'
arch=('i686' 'x86_64')
url="https://github.com/Aaronepower/tokei"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("https://github.com/Aaronepower/tokei/archive/${pkgver}.tar.gz")
md5sums=('ebd82544c0f33fb8c919a8e5fd4e84a6')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/release/tokei "${pkgdir}/usr/bin/tokei"
}
