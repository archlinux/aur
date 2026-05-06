# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tssh-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="Simple ssh client with trzsz ( trz / tsz ) support."
arch=(
    "aarch64"
    "i686"
    "x86_64"
)
url="https://trzsz.github.io/ssh"
_ghurl="https://github.com/trzsz/trzsz-ssh"
license=("MIT")
depends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/trzsz/trzsz-ssh/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_aarch64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('fd6a46d903e2a0a2ca996372c4cd844110a4ca435ecdd339324655ee0aafc67e')
sha256sums_aarch64=('90dd14290ddcd47b4681708ebc1964b37fcd4a1df0c3728beaf4fc06896b7a14')
sha256sums_i686=('fb817aca2aececfdeffed3394855b7f24f578a2eb71d3477f748ea0a0bde9f76')
sha256sums_x86_64=('f1bcb660eae4ed20d098bc8c6192f4cdcfa2cab3d1908da0fdeb8c4da5604dcc')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
