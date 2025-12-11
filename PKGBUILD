# Maintainer: Bertrand Gauriat <bertrand@gauri.at>
# Contributor: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.24.2
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

sha256sums_aarch64=('63c1c7e781914c7624cb30c826dd55b3b8797ce391b38ddd263eddeb999a463f')
sha256sums_armv7h=('1e78ae799ff889402d64b559352a50c59e82a7cc564d97e24ef63d04d00cdadd')
sha256sums_i686=('b8df4da98fcdbac1ac3fae746e0df76ec279f52ed26073cc1c7fef9f38fdcc77')
sha256sums_x86_64=('ab1e3ddc208fdd8ea1a1789cf3af5d83a8ed5c6a482788d09dfcd147adb2a2e4')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
