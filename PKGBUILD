# Maintainer: mineleng <15119587808@163.com>
pkgname=hexhub-deb
pkgver=1.3.1
pkgrel=1
pkgdesc="HexHub"
arch=('x86_64')
url="https://hexhub.cn"
license=('GPL')
depends=()
pkgdesc="database, docker, ssh, sftp. all in one"
provides=('HexHub')
source=("${pkgname}_${pkgver}_amd64.deb::https://oss.hexhub.cn/plugin/HexHub-amd64-deb-${pkgver}.deb")
sha256sums=('a616a4e489feb7bea65e10feca1f0d569568de92442abfffcb1885a44190eb79')

package() {
  # 解压 DEB 包中的 data 部分
  bsdtar -xf "${srcdir}/${pkgname}_${pkgver}_amd64.deb" -C "${pkgdir}" data.tar.xz
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  rm -f "${pkgdir}/data.tar.xz"
}
