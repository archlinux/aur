# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=weakauras-companion-bin
pkgver=3.2.2
pkgrel=1
pkgdesc="A cross-platform application built to provide the missing link between Wago.io and World of Warcraft. (This is a repackage of the official RPM package.)"
url="https://github.com/WeakAuras/WeakAuras-Companion"
license=("GPL2")
arch=("x86_64")

source=("${url}/releases/download/v${pkgver}/weakauras-companion-${pkgver}.x86_64.rpm")
sha256sums=("fecdb4fdf7c942bbe197eb1198d91e005ca1fc5fdbb0abbfa59b5bdf29ed6ea6")

depends=("electron")

package() {
    cd "${srcdir}" || exit
    cp -r opt/ usr/ "${pkgdir}"
    chmod 755 "${pkgdir}/opt" "${pkgdir}/usr"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}
