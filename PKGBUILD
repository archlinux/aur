# Maintainer: Your Name <you@example.com>
pkgname=cn.hexhub
pkgver=1.3.1
pkgrel=1
pkgdesc="HexHub"
arch=('x86_64')
url="https://hexhub.cn"                 # 请替换为实际项目主页
license=('custom')                     # 请填写实际许可证（如 'custom', 'GPL3' 等）
depends=()                              # 若有运行时依赖，请在此列出
provides=('HexHub')                     # 对应原 Provides 字段
source=("${pkgname}_${pkgver}_amd64.deb::https://oss.hexhub.cn/plugin/HexHub-amd64-deb-${pkgver}.deb")
sha256sums=('a616a4e489feb7bea65e10feca1f0d569568de92442abfffcb1885a44190eb79')

package() {
  # 解压 DEB 包中的 data 部分
  bsdtar -xf "${srcdir}/${pkgname}_${pkgver}_amd64.deb" -C "${pkgdir}" data.tar.xz
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  rm -f "${pkgdir}/data.tar.xz"
}
