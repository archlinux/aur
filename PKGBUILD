# Maintainer: Bertrand Gauriat <bertrand@gauri.at>
# Contributor: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.25.2
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

sha256sums_aarch64=('005c38b685aaa557e7d646d83a3dadb5024340eeed8c6a2e1949eee6f530de23')
sha256sums_armv7h=('7a12a63fd39fdbb84b41db14824822f2ce38a549b744ddb5647587ec3aa4cf2e')
sha256sums_i686=('c64c3bd3adb8884c8c3181f42a6191e367e25437d0e540ce0b8aa745c3de1592')
sha256sums_x86_64=('0d9dbfc26068b218e7ed84b104748cadc6e3cf733c0afd35465306fb39b9523c')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
