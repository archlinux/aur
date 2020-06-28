# Maintainer: WhriedPlanck

pkgname=electron-lark
pkgver=1.0.1
pkgrel=1
pkgdesc="使用 Electron 封装的网页版飞书 Feishu (原 Lark) 客户端, Linux 下可用"
arch=('x86_64')
url="https://github.com/Ericwyn/electron-lark"
#_from="https://feishu.cn"
license=('MIT')
depends=('libxss' 'gtk3' 'nss')
provides=('electron-lark')
conflicts=('electron-lark-git')
source=("https://github.com/Ericwyn/electron-lark/releases/download/V${pkgver}/${pkgname}_${pkgver}_amd64.deb"
         LICENSE)
sha256sums=('e2c39c931ee254c8e6ea18ad44f95efb1a763e4a7b24aca83b613eae30a617ae'
            '9ff448c71e670bdfd1b55c08cb377d49d3371d6442df5cf2aee30febb38ef292')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  cd "${pkgdir}"
  install -Dm644 "${srcdir}"/LICENSE usr/share/licenses/electron-lark-bin/LICENSE
  chmod 755 opt/
  chmod 755 usr/
  chmod 755 usr/share/
  chmod 755 usr/share/applications/
}
