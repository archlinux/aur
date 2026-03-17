# Maintainer: KevinLiu <kevin[at]atunemic.cn>
pkgname='sakura-frp-launcher-bin'
provides=('sakura-frpc' 'natfrp' 'sakura-frp-launcher')
pkgver=3.1.7
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
sha256sums_x86_64=('980ab185ce4ea8b8bf2e4b67a1b4ae742877c4dd229f8260c80a5cf2ae20a291')
sha256sums_armv7h=('d629cf08ed01f4858af1d9753ad6d1dc8002f6b7e7b0a9f3afbfe6f66f6a0642')
sha256sums_aarch64=('494779a44d279f0c0dc0b706d6618496711e2bee63daeec5ab842ed26e807b78')
sha256sums_i686=('f78bdbb671352f86cb06b64417283fb97c65257f4c9cfaa73abb8222c21f0b6d')

package() {
    install -Dm755 "${srcdir}/natfrp-service" "${pkgdir}/usr/bin/natfrp-service"
    install -Dm755 "${srcdir}/frpc" "${pkgdir}/usr/bin/natfrpc"

    mkdir -p "${pkgdir}/etc/natfrp"

    install -Dm644 "${srcdir}/natfrp.service" "${pkgdir}/usr/lib/systemd/system/natfrp.service"
}

