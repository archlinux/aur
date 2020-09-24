# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=modulo
pkgver=0.1.1
pkgrel=1
pkgdesc="Basic Cross-platform GUI Toolkit for Any Language"
arch=(x86_64)
url="https://github.com/federico-terzi/modulo"
license=("GPL3")
depends=("wxgtk2")
makedepends=("rust" "git" "clang")
source=("${pkgname}::git+https://github.com/federico-terzi/modulo.git#tag=v${pkgver}")
sha512sums=('SKIP')


check() {
    cd "$pkgname"

    cargo test --release # --locked # not available as of 2020/09/24
}

build() {
    cd "$pkgname"

    cargo build --release # --locked # not available as of 2020/09/24
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
