# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tssh-bin
pkgver=0.1.21
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
sha256sums=('af5ce9b9e9948f7afc2c2bd80a3dc27d94df19d5987fad4a5ff8a5f105637c9a')
sha256sums_aarch64=('8b9b0e73e259ddbe13aa9e1ea679c6706ae7d141cfdacacf6008b35820b31066')
sha256sums_i686=('e3fa844cff16c0b3c5367f714d2d92e7e64f91a67336953a69ba81f2e0ba796e')
sha256sums_x86_64=('a98e06ff1a9939edf11f0c7af59f9ad4cac188184c8849d8fac98aee941cf8ad')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}