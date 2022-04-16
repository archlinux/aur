# Maintainer: Jae Lo Presti <me@jae.fi>

pkgname=exiftool-rs-git
_pkgname=exiftool-rs
pkgver=r6.gd4fd6b1
pkgrel=1
pkgdesc='Image metadata scrubber written in Rust.'
arch=('x86_64')
url='https://github.com/jae1911/exiftool-rs'
license=('MIT')
depends=('rust')
source=("git+https://github.com/jae1911/exiftool-rs.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    echo r$(git rev-list --all --count).g$(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${_pkgname}"

    CARGO_INSTALL_ROOT="${pkgdir}/usr" cargo install --path .

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
