# Maintainer: Slash

pkgname=iso2opl-git
pkgver=r10.e98ad28
pkgrel=1
pkgdesc="ISO installer for Open PS2 Loader project (alternative to USBUtil)"
arch=('x86_64')
url="https://github.com/arcadenea/iso2opl"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('iso2opl::git+https://github.com/arcadenea/iso2opl.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/iso2opl/"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/iso2opl/"

    make
}

package() {
    cd "${srcdir}/iso2opl/"

    # Install binary
    install -D -m0755 "${srcdir}/iso2opl/iso2opl" \
        "${pkgdir}/usr/bin/iso2opl"
}
