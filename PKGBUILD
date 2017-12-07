# Maintainer: Márton Szabó <notramo@vipmail.hu> 
pkgname=tokei-git
pkgver=6.0.1
pkgrel=1
pkgdesc='A blazingly fast CLOC(Count Lines Of Code) program'
arch=('i686' 'x86_64')
url="https://github.com/Aaronepower/tokei"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
conflicts=('tokei')
source=("git+https://github.com/Aaronepower/tokei")
sha512sums=(SKIP)

build() {
    cd "${srcdir}/tokei"

    cargo build --release
}

package() {
    cd "${srcdir}/tokei"

    install -Dm755 target/release/tokei "${pkgdir}/usr/bin/tokei"

    install -Dm644 LICENCE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENCE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
