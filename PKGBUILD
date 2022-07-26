# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer:Integral<luckys68@126.com>
pkgname=douyin-uos
pkgver=1.0.2.7
pkgrel=3
pkgdesc="抖音桌面版 Tiktok desktop"
arch=('x86_64')
url="https://www.douyin.com/"
license=('custom')
depends=('qt5-webengine' 'qt5-x11extras' 'dtkwidget' 'deepin-qt5integration')
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.yunky.douyin/com.yunky.douyin_${pkgver}_amd64.deb"
)
sha512sums=('ace21759fee96df2c7bb7475f644a5328795e62668ec6a627bce16890d21b0d21fab389b8f16f121c31210419fe73ba78c0231418837d21691225edbf217e01d')

package() {
  echo "  -> Extracting the data.tar.xz..."
  bsdtar -xvf data.tar.xz -C "${pkgdir}/"

  echo "  -> Installing..."
  # Launcher
  install -Dm755 "${pkgdir}/opt/apps/com.yunky.douyin/DouYin" "${pkgdir}/usr/bin/${pkgname}"
}
