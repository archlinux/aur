# Maintainer: Ke Liu <spcter119@gmail.com>
# Contributor: huiyiqun <huiyiqun@gmail.com>
# Contributor: houbaron <https://github.com/houbaron>

pkgname=deepin-wxwork
pkgver=2.8.10.2010deepin0
pkgrel=1
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
md5sums=('a82495943fe4b748cf2b740704f1ec45'
         'df6b75140bf0d043eea0c7b5696d4704')

package() {
  cd $srcdir
  tar -xvf data.tar.xz -C $pkgdir
  cd $pkgdir
  install -Dm755 $srcdir/run.sh $pkgdir/opt/deepinwine/apps/Deepin-WXWork/run.sh
  chmod -x usr/share/applications/deepin.com.weixin.work.desktop
}
