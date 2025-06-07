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
            'fa8dc29dfe6d42760d693436771146dab8cb1a98d17222ad6778c8d5ba1f3def')


package() {
    # 安装二进制文件
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
    # 安装服务文件
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}
