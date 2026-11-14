# Maintainer: KevinLiu <kevin[at]atunemic.cn>
pkgname='sakura-frp-launcher-bin'
provides=('sakura-frpc' 'natfrp' 'sakura-frp-launcher')
pkgver=3.1.9
pkgrel=1
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
sha256sums_x86_64=('43130a2066c37b636459785ed33215e2bfb4af6b5f7480c2fb079e2667a0b8ac')
sha256sums_armv7h=('5462e37264c116489cae93173e30b83cb27e51fcedc7d3ebd6c01cddbcf95ac0')
sha256sums_aarch64=('ae5c547d56488cf7e3df315cc5f15d73d9d27e1ca4a3b8dda0fe65a38f41948c')
sha256sums_i686=('7c978303040205af5350f8609c2cf65b4df89d5b8ad5bc490c806481025d08a0')

package() {
    install -Dm755 "${srcdir}/natfrp-service" "${pkgdir}/usr/bin/natfrp-service"
    install -Dm755 "${srcdir}/frpc" "${pkgdir}/usr/bin/natfrpc"

    mkdir -p "${pkgdir}/etc/natfrp"

    install -Dm644 "${srcdir}/natfrp.service" "${pkgdir}/usr/lib/systemd/system/natfrp.service"
}

