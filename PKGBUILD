# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tssh-bin
pkgver=0.1.22
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
sha256sums_aarch64=('ecc3efd021a1932c1d61dc76d36cac0f2e1bd1c0ea8c6634f9521a36f388c301')
sha256sums_i686=('c5b01af3cac28e6255ede17c27de4618e77ffa54327f82111a1922e0f4091719')
sha256sums_x86_64=('41a3dc9102f6e4b8df0d553d43b3c576e0487da0b1ba804352e2c0e07b564131')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}