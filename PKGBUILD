# Maintainer: KevinLiu <kevin[at]atunemic.cn>
pkgname='sakura-frp-launcher-bin'
provides=('sakura-frpc' 'natfrp' 'sakura-frp-launcher')
pkgver=3.1.5
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
sha256sums_x86_64=('3d363e444b60e0439989b9f54d4030d0dd1e9caf69f8ddae072775825a1fb57d')
sha256sums_armv7h=('254c8f18474587d6cbd480d791b22a126bc54c319b5dc10352e7633afa419cbd')
sha256sums_aarch64=('00a45fb878eeb4e07f9954aeab2f21993d9d99e3daa23c8e75a21e2f63ff9f6a')
sha256sums_i686=('1e0a29e68737f35d7342e6785ac7edbe0ebbf6610e03f53c9c7269c3ddeb7e5d')

package() {
    install -Dm755 "${srcdir}/natfrp-service" "${pkgdir}/usr/bin/natfrp-service"
    install -Dm755 "${srcdir}/frpc" "${pkgdir}/usr/bin/natfrpc"

    mkdir -p "${pkgdir}/etc/natfrp"

    install -Dm644 "${srcdir}/natfrp.service" "${pkgdir}/usr/lib/systemd/system/natfrp.service"
}

