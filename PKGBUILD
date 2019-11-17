# Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

pkgname=xiaomitool-v2
pkgver=9.11.10
pkgrel=1
pkgdesc='Modding of Xiaomi devices made easy for everyone'
arch=(any)
license=(custom)
url=https://www.xiaomitool.com/V2/
source=(
  "https://github.com/francescotescari/XMT/releases/download/v$pkgver/XMT2_Linux_$pkgver.run"
  'xiaomitool'
  'xiaomitool.appdata.xml'
  'xiaomitool.desktop'
  'xiaomitool.menu'
  'xiaomitool.xml')
sha256sums=(
  'ca3a7b1344733ba9b91e8c4a73bfb3dbf761d3fb721019c5683e25906551cf23'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')

package() {
  cd $srcdir
  sh "XMT2_Linux_$pkgver.run" --noexec

  mkdir "$pkgdir/opt"
  mv XiaoMiTool-V2 "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  install -m755 xiaomitool "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/appdata"
  install -m644 xiaomitool.appdata.xml "$pkgdir/usr/share/appdata"
  mkdir "$pkgdir/usr/share/applications"
  install -m644 xiaomitool.desktop "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/gnome-control-center/default-apps"
  install -m644 xiaomitool.xml "$pkgdir/usr/share/gnome-control-center/default-apps"
  mkdir -p "$pkgdir/usr/share/menu"
  install -m644 xiaomitool.menu "$pkgdir/usr/share/menu"
}
