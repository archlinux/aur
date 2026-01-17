# Maintainer: Bertrand Gauriat <bertrand@gauri.at>
# Contributor: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.24.4
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

sha256sums_aarch64=('0fcf85b736895f46daa38eec5871ef1ca3d1e38b20201b2811b26258faccf1c7')
sha256sums_armv7h=('b8d64c0314315f5edce815b9700ab575dbfa84030c6bc9d04776ae2a7918079d')
sha256sums_i686=('05cde4ee5746a3a47c1862f1b5f426f3cbd6c78a775d4dccd71c013a8623c477')
sha256sums_x86_64=('c47e6f4b61debde5422183c7eb446a704a92c58b4c35bbd128c722d8bf269a86')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
