# Maintainer: Lonny Wong <lonnywong@qq.com>
pkgname=tssh-bin
pkgver=0.1.14
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
sha256sums=('db6828b2a76b5eed672385df455492375d87f57c5f0da1f5b9bc0916bf58ece3')
sha256sums_aarch64=('8ebbf2e56648ce9274d2e12f32072a379c097a67d4bd1d325163e9ab2cd611a4')
sha256sums_i686=('caab3bddd87adad9c4c8afb69622936caadb5ab971ba0040b3cbe7cf4b385af0')
sha256sums_x86_64=('591f5cc4fc996e18754ac08d48492bec7608ffb76401fe356843dc480348f6c8')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}