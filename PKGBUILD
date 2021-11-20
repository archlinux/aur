# Maintainer Harvies <delverjw@gmail.com>
pkgname=feishu
pkgver=4.11.6_2
pkgrel=1
pkgdesc="飞书官网Linux客户端(视频会议分享屏幕可用)"
arch=('x86_64')
url="https://www.feishu.cn"
license=('unknown')
depends=('nss' 'libx11' 'libxcb' 'libxext' 'wget' 'xdg-utils')
makedepends=()
optdepends=()
source=('https://sf3-cn.feishucdn.com/obj/suite-public-file-cn/v5x9pa/bytedance-feishu-beta_4.11.6-2_amd64.deb')
sha256sums=('9a844502ee721defb1bfe37764c7a3c0fe1dc64c99185ae9b6368826e2fefb5a')

package() {
  cd ${pkgdir}
  tar xvf ${srcdir}/data.tar.xz
  for res in {16,24,32,48,64,128,256}
  do
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps;
    mv ${pkgdir}/opt/bytedance/feishu/product_logo_${res}.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/bytedance-feishu.png;
  done
}
