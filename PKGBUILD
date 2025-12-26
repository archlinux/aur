# Maintainer: zefr0x <>

pkgname="edit0"
pkgver="0.5.6"
pkgrel=1
pkgdesc="Script to edit a single file as root using run0"
arch=("any")
url="https://github.com/HastD/run0edit"
license=("MIT OR Apache-2.0")
depends=("systemd>=256")
source=("run0edit-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("62da6d1beadb465c6b5ee82cf29dee75dfc8d8985f9e41b8629e0ab1d6e4b477a12091c6509a67aa9aa1ac7ea7e53774416fdd3e0b8e163c956ffe26baa4f13d")

package() {
    cd "run0edit-${pkgver}"

    install -Dm755 "run0edit_main.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "run0edit_inner.py" "${pkgdir}/usr/libexec/run0edit/run0edit_inner.py"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
