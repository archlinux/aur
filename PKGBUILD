# Maintainer: lucas007 <lucaszhou007@163.com>

pkgname=garage-webui-bin
_pkgname=garage-webui
pkgver=1.0.9
pkgrel=2
pkgdesc="Garage去中心化的存储服务的前端UI界面。"
url="https://github.com/khairul169/garage-webui"
arch=("any")
license=('MIT')
conflicts=('garage-webui')
provides=('garage-webui')
depends=('garage')
arches=('x86_64' 'i686' 'aarch64' 'armv7h' )

source_x86_64=("$_pkgname::https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-amd64")
source_i686=("$_pkgname::https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-386")
source_aarch64=("$_pkgname::https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-arm64")
source_armv7h=("$_pkgname::https://github.com/khairul169/garage-webui/releases/download/${pkgver}/garage-webui-v${pkgver}-linux-arm")

sha256sums_x86_64=('46b01c5e0c306873db249613de7609b3665b2c3695596e77e98ee4a00030252f')
sha256sums_i686=('28a25763b4a57aae59e1b4b4560615aea4b41dabd39734e9cbcbb41826935c30')
sha256sums_aarch64=('89a9657b8cd70af731ebca4e4c643b76ae8c58dd3bcf36c77af4ab3f0e8830a2')
sha256sums_armv7h=('4d54bd88967541143704eb35126e9b6247ba851d34b65bfe3857fa8c6445a00f')

source=("${_pkgname}.service")
sha256sums=('5e5b86f12a7e58dce8af34e5a631bc0b822910f030234aa463424441841e7c39')

package() {
    # 安装二进制文件
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    # 安装服务文件
    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}