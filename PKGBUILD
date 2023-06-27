# Maintainer: everyx <lunt.luo#gmail.com>

_pkgname=mockplus-dt-font-agent
pkgname=${_pkgname}-bin
pkgver=1.0.2
pkgrel=3
pkgdesc="Mockplus DT - Font Agent"
arch=("any")
url="https://www.mockplus.cn/dt"
license=("custom")
depends=('fontconfig' 'freetype2' 'libevent' 'nlohmann-json')
provides=("${_pkgname}")
source=("${_pkgname}.zip::https://dt.mockplus.cn/plugin-downloads/MockplusDTFontAgentInstall_linux_v${pkgver}.zip")
sha512sums=("7223c1594ac223c3232fa2548a56b54d471d580e0b9b723b8a62a0f63f98ca48651983aed123a261f8a2c92209086d78ed1edb4ee962c8032eb78f1e807c64da")

_user=mockplus

build(){
  sed -i 's|/usr/local/bin/|/usr/bin/|' DTFontAgent.service
}

package() {
  install -Dm755 DTFontAgent          -t "$pkgdir/usr/bin/"
  install -Dm644 DTFontAgent.service  -t "$pkgdir/usr/lib/systemd/user/"
}
