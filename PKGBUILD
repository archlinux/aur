# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tssh-bin
pkgver=0.1.26
pkgrel=1
pkgdesc="Simple ssh client with trzsz ( trz / tsz ) support."
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://trzsz.github.io/ssh"
_ghurl="https://github.com/trzsz/trzsz-ssh"
license=('MIT')
depends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/trzsz/trzsz-ssh/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_aarch64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('fd6a46d903e2a0a2ca996372c4cd844110a4ca435ecdd339324655ee0aafc67e')
sha256sums_aarch64=('aa87c3022096b1ac6f583e1af04675419ec777ec3336a34d353efce73b75a0a9')
sha256sums_i686=('08cb787ba3ea5cc07b3711e402e2b0978b89834c7ac93a83e846ba9636a56b35')
sha256sums_x86_64=('e01cfacb5fef97b4eb2b5521ad2c9c27ec4892088ae75d329bcef9e290723301')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
