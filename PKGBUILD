# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=trzsz-bin
pkgver=1.1.8
pkgrel=1
pkgdesc="The go version of trzsz, makes all terminals that support local shell to support trzsz ( trz / tsz ).(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://trzsz.github.io/go"
_ghurl="https://github.com/trzsz/trzsz-go"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/trzsz/trzsz-go/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_i386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.rpm")
sha256sums=('217dc855e352e15b989c68acd856903e4d4b8b40d84956c7acf7d37c09495199')
sha256sums_aarch64=('ef3eca00e7292cfdea5163d86233c666983cc3bdade40ad4779529fb5a6f986a')
sha256sums_armv7h=('aace5fbefbec3a086a1c670d71c9d521595c33a832fe8db8e64fe16c6c44e016')
sha256sums_i686=('fcdf231badc6efa420742bd9e418265e9fb60442f5df675cd54bc3b5c5721572')
sha256sums_x86_64=('42486e81b46dc15de6054aadf65d532948b5a8a5e362cc66e0ae7c3e2f4248b6')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}