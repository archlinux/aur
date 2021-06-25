# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=weakauras-companion-bin
pkgver=3.3.3
pkgrel=1
pkgdesc="A cross-platform application built to provide the missing link between Wago.io and World of Warcraft. (This is a repackage of the official RPM package.)"
url="https://github.com/WeakAuras/WeakAuras-Companion"
license=("GPL2")
arch=("x86_64")

source=("${url}/releases/download/v${pkgver}/weakauras-companion-${pkgver}.x86_64.rpm")
sha256sums=("d9e61e0bff6b1f91c2d3095a6b0f39df954f7bd8e108ecb38aebd01b717f4a35")

depends=("electron")

package() {
    cd "${srcdir}" || exit
    cp -r opt/ usr/ "${pkgdir}"
    chmod 755 "${pkgdir}/opt" "${pkgdir}/usr"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}
