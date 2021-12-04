pkgname="oh-my-dde-bin"
pkgver="1.0.3"
pkgrel=1
pkgdesc="A customization tool for deepin desktop environmen."
arch=('any')
url="https://gitee.com/Limexb/oh-my-dde"
license=('unknown')
provides=("oh-my-dde")
depends=('xautomation' 'xclip' 'gsettings-desktop-schemas' 'dtkwidget')
makedepends=('bzip2')
source=("https://gitee.com/Limexb/oh-my-dde/attach_files/845257/download/top.yzzi.youjian_1.0.3_amd64.deb")
sha256sums=('5746784feb5bfd281119940a69b6e8a13a0157301d529b38af40a0a67fb1fcb2')
build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}
package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/opt/apps/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

  cp -r "${srcdir}/output/opt/apps" "${pkgdir}/opt/"
  ln -s /opt/apps/top.yzzi.youjian/files/oh-my-dde "${pkgdir}/usr/bin/oh-my-dde"
  ln -s /opt/apps/top.yzzi.youjian/entries/applications/top.yzzi.youjian.desktop "${pkgdir}/usr/share/applications/top.yzzi.youjian.desktop"
  ln -s /opt/apps/top.yzzi.youjian/entries/icons/hicolor/scalable/apps/youjian.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
