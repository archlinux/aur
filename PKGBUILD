# Maintainer: KevinLiu <kevin[at]atunemic.cn>
pkgname='sakura-frp-launcher-bin'
provides=('sakura-frpc' 'natfrp' 'sakura-frp-launcher')
pkgver=3.1.6
pkgrel=3
pkgdesc="A daemon for a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
license=('Property')
url="https://www.natfrp.com/tunnel/download"
depends=('glibc')
install='natfrp.install'
makedepends=("zstd")
options=("!strip")

source_x86_64=("natfrp-service-${pkgver}_linux_amd64.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_amd64.tar.zst")
source_armv7h=("natfrp-service-${pkgver}_linux_armv7.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_armv7.tar.zst")
source_aarch64=("natfrp-service-${pkgver}_linux_arm64.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_arm64.tar.zst")
source_i686=("natfrp-service-${pkgver}_linux_386.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_386.tar.zst")
source=('natfrp.service')

sha256sums=('37de6651e7ce428cb9143cd3bd12b61ff0af59be0d32b15f58d06dbd657d6d04')
sha256sums_x86_64=('1d310284a7cd3590177e1a86805c6d617153d6671e675a60ddfb475b8fd04b1f')
sha256sums_armv7h=('e6e0f2f671d4c4c16498a26477d23bd8aa4a48bf491813c5daa94b0a5b76c35b')
sha256sums_aarch64=('cbb6d5db0877b13c71bf8d44957b89699de63866c30aa9bbb0dc0cdf4aba5e8e')
sha256sums_i686=('a46a80fe6b73d85d7b72615743181ba4efefc1e99a498a93cbc8eac897c245b8')

package() {
    install -Dm755 "${srcdir}/natfrp-service" "${pkgdir}/usr/bin/natfrp-service"
    install -Dm755 "${srcdir}/frpc" "${pkgdir}/usr/bin/natfrpc"

    mkdir -p "${pkgdir}/etc/natfrp"

    install -Dm644 "${srcdir}/natfrp.service" "${pkgdir}/usr/lib/systemd/system/natfrp.service"
}

