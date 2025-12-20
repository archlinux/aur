# Maintainer: Bertrand Gauriat <bertrand@gauri.at>
# Contributor: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.24.3
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

sha256sums_aarch64=('fa233d7303f34bf2c71a8a53afd761852ad97c0dbeac4dbf806f8f06ef6e4c9e')
sha256sums_armv7h=('280cdffcbb1d83e68df8052920643c3adac09a01910e4e2fdcafeae2c498fa51')
sha256sums_i686=('745128939f9d1a828d4c9f9dee2bcf26a97854ec4e3bdec6747ac612c3bf1957')
sha256sums_x86_64=('39f81a138fbd3290b5b78fa22d73793f856a2323b39241644c4fcc197718cdb4')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
