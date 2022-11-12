# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.20.0
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

sha256sums_aarch64=('1c318e22be15ef2ae44ed83782e441f1c47db63f97db0aebe46c5f608f1b0400')
sha256sums_armv7h=('f8bacd56eeac2d5255f9a54064c7c5bbc6eff475fd005a4ceae8aa428ad20c39')
sha256sums_i686=('c6d67239dded6cc420708e2378abe99b691a4c84812dfa5139dff25300af8bb7')
sha256sums_x86_64=('b025ddbf607d97936382bd60d776fdf8bb2b42da4341e2a2022d821f314b79d3')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
