# Maintainer  Harvies <delverjw@gmail.com>
# Contributor cupen   <xcupen@gmail.com>
pkgname=feishu-latest
pkgver=5.4.13
pkgrel=1
pkgdesc="飞书官网Linux客户端(视频会议分享屏幕可用)"
arch=('x86_64')
url="https://www.feishu.cn"
license=('unknown')
depends=('nss' 'libx11' 'libxcb' 'libxext' 'wget' 'xdg-utils')
makedepends=()
optdepends=()
source=("https://sf3-cn.feishucdn.com/obj/ee-appcenter/e734d9e40e6a/Feishu-linux_x64-5.4.13.deb")
sha256sums=("26dddc20e13f733640dbf8669f4dc24f8c098d5db71f9f86ffe33546a68a5986")

package() {
  cd ${pkgdir}
  tar xvf ${srcdir}/data.tar.xz
  for res in {16,24,32,48,64,128,256}
  do
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps;
    mv ${pkgdir}/opt/bytedance/feishu/product_logo_${res}.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/bytedance-feishu.png;
  done
}
