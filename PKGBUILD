# Maintainer: Andew Shark ashark AatT linuxcomp.ru

pkgname='dl-switch'
pkgver='1'
pkgrel='1'
pkgdesc='Easy way to switch between displaylink and optimus'
arch=('any')
url='https://github.com/Ashark/DisplayLink-switch'
license=('GPL3')
depends=()
source=("https://raw.githubusercontent.com/Ashark/DisplayLink-switch/master/displaylink-workaround1"
        "https://raw.githubusercontent.com/Ashark/DisplayLink-switch/master/displaylink.target"
        "https://raw.githubusercontent.com/Ashark/DisplayLink-switch/master/dl-switch.service")
sha256sums=('2d8761e2abf30f06080dec0f060817c5204b528b95137d3d19697640977097ec'
            '7822a30c9589922fa36a876bf4d9ccdd2fda10210f498823f497e85f5f41ec6f'
            '775d57eea54826f523c1458575c314c60feb550d60a62fd1f7b772c561cf160a')

package() {
  cd "${srcdir}"
  install -Dm644 "displaylink-workaround1" "${pkgdir}/usr/share/X11/xorg.conf.d/displaylink-workaround1"
  install -Dm644 "displaylink.target" "${pkgdir}/usr/lib/systemd/system/displaylink.target"
  install -Dm644 "dl-switch.service" "${pkgdir}/usr/lib/systemd/system/dl-switch.service"
}

install=dl-switch.install
