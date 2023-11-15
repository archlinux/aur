# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=s5cmd-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="Parallel S3 and local filesystem execution tool"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url='https://github.com/peak/s5cmd'
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-32bit.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-64bit.tar.gz")
sha256sums_aarch64=('eabf18082398c332d33c692d383a889be204b1e7716f820e014bf11474ad345b')
sha256sums_armv7h=('eabf18082398c332d33c692d383a889be204b1e7716f820e014bf11474ad345b')
sha256sums_i686=('dc9ebe570fb5abcf5781511901d93425879022d56e73ab44dd32c45b2bfbc04b')
sha256sums_x86_64=('a15f83d2a6dc091e43b2a120f29f8f6c86d146c381766c0197ec75d7985af2b6')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}