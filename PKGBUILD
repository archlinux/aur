# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.21.0
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

sha256sums_aarch64=('a9ad42eed319ef1f958acd944b2044469a0210662084fc41d1df67b54c733f31')
sha256sums_armv7h=('3f1c86ab9c5d71ff6e6cccbcbe7ea21ba50f44e13a1e9b19b2957e2fb1fc20f8')
sha256sums_i686=('ec701477c79f5aa8a92076d41f51218439d7d90d04c8f42ab9b3afe761520aec')
sha256sums_x86_64=('b81335d0584977b6853c9d671be957f886daa51819efeba2b0a8804ea21b34df')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
