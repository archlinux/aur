# Maintainer:  Rock Neurotiko <rockneurotiko AT GMAIL>
pkgname=regect-git
_pkgname=regect
pkgver=0.2.5
pkgrel=1
pkgdesc="regex 101 like cli tool."
arch=('x86_64')
url="https://github.com/kloki/regect"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#branch=master")
sha256sums=("SKIP")

# No tags, so we don't override for now
# pkgver() {
#     cd "$pkgname"
#     git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    cd "${pkgname}"
    cargo build --release
}

package() {
    cd "${pkgname}"

    install -Dm755 target/release/regect -t "${pkgdir}/usr/bin" || return 1
}
