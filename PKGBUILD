# Maintainer: mineleng <15119587808@163.com>
pkgname=hexhub-deb
pkgver=5.1.9
pkgrel=1
pkgdesc="HexHub"
arch=('x86_64')
url="https://hexhub.cn"
license=('GPL')
depends=()
pkgdesc="database, docker, ssh, sftp. all in one"
provides=('HexHub')
source=("${pkgname}_${pkgver}_amd64.deb::https://oss.hexhub.cn/plugin/HexHub-Client-linux-amd64-deb-5.1.9-202606072154.deb")
sha256sums=('2acb2b03817bbd66a7072f912c570546f19ab0472b9b7da4af5ffff17512857c')

package() {
  # 解压 DEB 包中的 data 部分
  bsdtar -xf "${srcdir}/${pkgname}_${pkgver}_amd64.deb" -C "${pkgdir}" data.tar.xz
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  rm -f "${pkgdir}/data.tar.xz"
}
	

