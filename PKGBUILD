# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tssh-bin
pkgver=0.1.16
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
sha256sums_aarch64=('02429e05bdc6e03fc79b61e25ae44a8970018c891a21d332b52b6a226b3d8554')
sha256sums_i686=('7e2f42ec3c9d69e4254fa84ad8a02b31bafa5f739843a5b883be1a7620a0d044')
sha256sums_x86_64=('cfd8d6fdf5a84ee2fc8938101ab0d0e08d36e60233c918fa41bec478ce7b3b9a')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}