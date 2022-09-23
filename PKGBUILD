# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=ctyun-cloud-desk
pkgver=1.34.4
pkgrel=201340400
pkgdesc="天翼云电脑linux客户端:天翼云电脑（Ctyun-Laptop）是云计算技术和终端相结合的创新型产品。依托中国电信优质云网资源，结合自主研发的CLINK数据安全传输协议，具备多重数据安全防护机制，实现安全高效的云电脑使用体验。提供一键部署、灵活可配、集中管控能力，广泛应用于办公、教育、医疗等行业使用场景。"
arch=("x86_64")
url="https://www.ctyun.cn/"
license=()
depends=('gtk3' 'libnotify' 'libxss' 'libxtst' 'xdg-utils' 'libusb'  'pulseaudio' 'lib32-util-linux' 'util-linux-libs' 'opus' 'pixman')
source=(
  "https://desk.ctyun.cn:8999/desktop-prod/software/linux_x86_xc_client/11/64/$pkgrel/CtyunClouddeskUniversal-$pkgver-$pkgrel-amd64-202207141538.deb")
sha256sums=('dc241a446104c4ebbcd64c1c5a1709c80dbd73d5eadf84777468d5e536d5e8f8')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.gz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
