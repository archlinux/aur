# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Sergey Bargamon <sergey@bargamon.ru>
pkgname=clink
pkgver=0.4.1
pkgrel=2
pkgdesc="Url cleaner"
arch=("x86_64")
url="https://github.com/Lurk/clink"
license=("MIT")
makedepends=("cargo" "git")
source=("git+$url#tag=$pkgver")
md5sums=("SKIP")

build() {
    cd $pkgname
    cargo build --release
}

package() {
    cd $pkgname
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

