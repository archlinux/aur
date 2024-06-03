# Maintainer: Ariel Horwitz <ariel.horwitz+aur@gmail.com>
pkgname="spongecrab"
pkgver="0.2.3"
pkgrel=1
pkgdesc="Bringing powerful argument parsing to bash scripts"
arch=('x86_64')
url="https://github.com/ArielHorwitz/spongecrab"
license=('Unlicense')
groups=('iukbtw')
makedepends=('git' 'rust')
provides=('spongecrab')
conflicts=('spongecrab')
source=("git+https://github.com/ArielHorwitz/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!debug')

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release --locked
}

check() {
    cd "${srcdir}/${pkgname}"
    cargo test --locked
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 ./target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
