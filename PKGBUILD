# Maintainer: lucas007 <lucaszhou007@163.com>

pkgname=garage-webui
pkgver=1.0.9
pkgrel=2
pkgdesc="Garage去中心化的存储服务的前端UI界面。"
url="https://github.com/khairul169/garage-webui"
arch=("any")
license=('MIT')
provides=('garage-webui')
depends=('garage-bin')
install=garage-webui.install
source=("$pkgname::https://github.com/khairul169/garage-webui/releases/download/1.0.9/garage-webui-v1.0.9-linux-amd64"
        "$pkgname.service")

sha256sums=('46b01c5e0c306873db249613de7609b3665b2c3695596e77e98ee4a00030252f'
            'd04ce0911920652e80444c5b853c57e6b90d3b752cdeea9944fcb43c3e6fabad')


package() {
    # 安装二进制文件
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
    # 安装服务文件
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}
