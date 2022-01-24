# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=bore-client-git
pkgver=r47.92498fe
pkgrel=1
license=("MIT")
pkgdesc="Reverse HTTP/TCP proxy to help you expose a local server behind a NAT or firewall to the internet via secure SSH tunnels"
url="https://bore.network"
makedepends=("go")
arch=("x86_64" "aarch64")
provides=("bore")
source=("git+https://github.com/jkuri/bore.git")
sha512sums=("SKIP")

pkgver() {
    cd bore
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd bore
    make build_client
}

package() {
    cd bore
    install -Dm755 build/bore "${pkgdir}"/usr/bin/bore
}
