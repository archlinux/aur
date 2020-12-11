# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >

# General package information
pkgname=weakauras-companion-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="A cross-platform application built to provide the missing link between Wago.io and World of Warcraft. (This is a repackage of the official RPM package.)"
url="https://github.com/WeakAuras/WeakAuras-Companion"
license=("GPL2")
arch=("x86_64")

source=("${url}/releases/download/v${pkgver}/weakauras-companion-${pkgver}.x86_64.rpm")
sha512sums=("c31665ac829a5ff3ec3ba7fe84f5a73932e63d10dc9535635128a94c68b3c0e6a5764d7b55472f20c3275a594b739494a93a80a6a847339dfe35f578abd15db6")

depends=("electron")

package() {
    cd "${srcdir}" || exit
    cp -r opt/ usr/ "${pkgdir}"
    chmod 755 "${pkgdir}/opt" "${pkgdir}/usr"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "${pkgdir}/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}
