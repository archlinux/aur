# Maintainer: Pedro Tashima <pedrotashima42@gmail.com>
_pkgname=hash-id
pkgname=${_pkgname}
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Hash Identifying tool"
license=('GPL3')
url="https://github.com/tashima42/hash-id/"
source=("${_pkgname}::git+https://github.com/tashima42/${_pkgname}.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
    cd "$_pkgname"

    cargo build --release --locked
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
