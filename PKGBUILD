pkgname=deepin-wxwork
pkgver=2.4.16.1347deepin0
pkgrel=1
pkgdesc="Tencent Weixin Work Client on Deepin Wine"
arch=("x86_64")
url="http://www.deepin.com/"
license=('custom')
depends=('p7zip' 'wine')
_mirror="https://mirrors.tuna.tsinghua.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.weixin.work/deepin.com.weixin.work_${pkgver}_i386.deb")
md5sums=('dc47977f4799a11ec0b8d437185f5404')

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  cd ${pkgdir}
  chmod -x usr/share/applications/deepin.com.weixin.work.desktop
  sed '30a\sed -i "s/deepin-wine/LANG=zh_CN.UTF-8 wine/" $1/drive_c/deepin/EnvInit.sh' -i opt/deepinwine/apps/Deepin-WXWork/run.sh
}
