pkgname=deepin-wxwork
pkgver=2.4.16.1347deepin0
pkgrel=2
pkgdesc="Tencent Weixin Work Client on Deepin Wine"
arch=("x86_64")
url="http://www.deepin.com/"
license=('custom')
depends=('p7zip' 'wine')
_mirror="https://mirrors.tuna.tsinghua.edu.cn/deepin"
source=(
    "$_mirror/pool/non-free/d/deepin.com.weixin.work/deepin.com.weixin.work_${pkgver}_i386.deb"
    run.sh
)
md5sums=('dc47977f4799a11ec0b8d437185f5404'
         'abafc528b0bc36910ea50c12ee4b0c3f')

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  cd ${pkgdir}
  chmod -x usr/share/applications/deepin.com.weixin.work.desktop
  mv $srcdir/run.sh opt/deepinwine/apps/Deepin-WXWork/run.sh
}
