# Maintainer: KevinLiu <kevin[at]atunemic.cn>
pkgname='sakura-frp-launcher-bin'
provides=('sakura-frpc' 'natfrp' 'sakura-frp-launcher')
pkgver=3.1.4
pkgrel=1
pkgdesc="A daemon for a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
license=('Property')
url="https://www.natfrp.com/tunnel/download"
depends=('glibc')
install='natfrp.install'
makedepends=("zstd")
options=("!strip")

source_x86_64=("natfrp-service_linux_amd64.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_amd64.tar.zst")
source_armv7h=("natfrp-service_linux_armv7.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_armv7.tar.zst")
source_aarch64=("natfrp-service_linux_arm64.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_arm64.tar.zst")
source_i686=("natfrp-service_linux_386.tar.zst::https://nya.globalslb.net/natfrp/client/launcher-unix/${pkgver}/natfrp-service_linux_386.tar.zst")
source=('natfrp.service')

sha256sums=('37de6651e7ce428cb9143cd3bd12b61ff0af59be0d32b15f58d06dbd657d6d04')
sha256sums_x86_64=('ca1280e565a44947c2aa34d51acdc76a935521a4c57239aebc242cab49532893')
sha256sums_armv7h=('a96fb34e42d81ca8714b192360657cc9451189bd9f18ee270e653c9275e9163d')
sha256sums_aarch64=('efba7a2e1296ea8b03b67132313dbc7417c137e6cb96678c977ab3f1a9a56598')
sha256sums_i686=('71f1d0b9c636440e6c2739dc5704cd6f767a709209007bcd261a7cbf024255dd')

package() {
    install -Dm755 "${srcdir}/natfrp-service" "${pkgdir}/usr/bin/natfrp-service"
    install -Dm755 "${srcdir}/frpc" "${pkgdir}/usr/bin/natfrpc"

    mkdir -p "${pkgdir}/etc/natfrp"

    install -Dm644 "${srcdir}/natfrp.service" "${pkgdir}/usr/lib/systemd/system/natfrp.service"
}

