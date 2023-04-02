# Maintainer: hellopoisonx <1665341912@qq.com>
# Contributor: hellopoisonx <1665341912@qq.com>
pkgname=wiliwili-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="一个专为手柄用户设计的第三方 B站客户端"
arch=('x86_64')
url="https://github.com/xfangfang/wiliwili"
license=("GPL3")
depends=('mpv')
conflicts=("wiliwili-git")
source=("https://gitee.com/hellopoisonx/aur-wiliwili-bin/raw/master/wiliwili.tar.gz" "https://gitee.com/hellopoisonx/aur-wiliwili-bin/raw/master/wiliwili.desktop" "https://gitee.com/hellopoisonx/aur-wiliwili-bin/raw/master/resources.tar.gz")
sha256sums=('14a83b98d6f7c142fcc91149bf32eade2ac00d753cf8d92f4147898ac793e822'
            'd7c4fb2600d372c43026b9a4f63ba23592dcb62916eb2dfd90b8e05b21ad369b'
            'fd3e6ac9ddedaa93fa6dd1cb1e856b1e0b1018343e4de5bcc8a2cc4e08beba65')
prepare() {
  cd ${srcdir}
  tar xpvf wiliwili.tar.gz -C "$srcdir"
  tar xpvf resources.tar.gz -C "$srcdir"
}

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/usr/share/wiliwili"
  #resources
  cp -r  "${srcdir}/resources" "${pkgdir}/usr/share/wiliwili/"
  #install the binary file
  install -Dm755 "wiliwili" "${pkgdir}/usr/bin/wiliwili"
  #Desktop file
  install -Dm755 "wiliwili.desktop" -t "$pkgdir/usr/share/applications/wiliwili.desktop" 
  install -Dm644 "${srcdir}/resources/icon/wiliwili.ico" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
