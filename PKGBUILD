# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.10
pkgrel=1
pkgdesc='A simple terminal UI for docker and docker-compose, written in Go with the gocui library.'
url="https://github.com/jesseduffield/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('aarch64' 'armv7h' 'i686' 'x86_64')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_x86_64=('348ad8a05ecff6330f00012cb0963c94f27f3ea195fc4252daa8714ed09b9b9f')
sha256sums_i686=('db9529f998e91734c873791dcf1984d04670a73e15afca1338904184bec32aba')
sha256sums_armv7h=('754dd9dcf5c215b7baf240349d125643d2ac9dac0989d545accaa46ec4a2382c')
sha256sums_aarch64=('c1199870eb81280b699dea79a1f125241295fcc223466831131df75f4f01cacb')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
