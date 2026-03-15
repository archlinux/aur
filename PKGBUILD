# Maintainer: Bertrand Gauriat <bertrand@gauri.at>
# Contributor: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.25.0
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

sha256sums_aarch64=('75bf3df5ee3bfd8f20a98c009d6f6787d009f03385d0d56b2a2aea26bdb7c287')
sha256sums_armv7h=('ba6d58fcbd8fe1e6d2e08a8ee83c005ce82e1a95ddf6bf475ce98a88ebfea6a9')
sha256sums_i686=('d0a3e52ecbfba60715217f606e94342b1c55dc78242b358f542ec3607a2328d7')
sha256sums_x86_64=('9c17b1458b214af50168f5f5e981f1f9c4b34d13a22734b7318bf9a05132ff3d')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
