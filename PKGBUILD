# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.23.3
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

sha256sums_aarch64=('ae7bed0309289396d396b8502b2d78d153a4f8ce8add042f655332241e7eac31')
sha256sums_armv7h=('9962c7d9cb3b5922c52c3f123ab972ae7bda8a29928084ab4719a94a2f4f1e6f')
sha256sums_i686=('567a3c28708ee68f8816031dd64ea77eb70eeb64a48ff920fa81548bf87a416e')
sha256sums_x86_64=('1f3c7037326973b85cb85447b2574595103185f8ed067b605dd43cc201bc8786')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
