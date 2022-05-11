# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.18.1
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

sha256sums_aarch64=('e6b64c5fd9fee45630175ecb19241b6589a9db10225d4da36de853d218815861')
sha256sums_armv7h=('449bbd310310ca4b232a095901c8a4adac33988145a428ad34216eae662402b0')
sha256sums_i686=('6e33a107ac687054fb633cc12d4c81d352b8657a6a9827119833d78f37dcf5e6')
sha256sums_x86_64=('c42ac84b27c9c2a1508f61379dd730bd9006bfd5919b4776466f6f0e582a991a')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
