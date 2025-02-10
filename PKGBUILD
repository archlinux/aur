# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=min-ed-launcher
pkgname=${_pkgname}-bin
pkgver=v0.11.2
pkgrel=1
pkgdesc="Minimal Elite Dangerous Launcher"
arch=('x86_64')
url="https://github.com/Rfvgyhn/min-ed-launcher"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install="${_pkgname}.install"
changelog=CHANGELOG.md
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux-x64.tar.gz"
	"CHANGELOG.md"
	"${_pkgname}.install")
sha512sums=('dcb2bc23ce21a2a14c9a0f2a6281cce8b583f8d6e3ff954e689cb7e0ee7c907816a46272886136c843b13d139199cb00f96cdeece4a764fad61a76f2b8eb4847'
            'd115d63317536b3db6eeb0e0059cd81cab154eb265b1a9613558d6b0bca4513b4303905704a1f43d4ced67de4eb22ba141f491e72c892e917c0be14d44849006'
            '33d77b3f3511bf97f5166a8a909744954e1047929dc416db2fe76b0bd52425e02ceba8cad0a416df53e004ca48e68f7bbfd1227e015253345c8495e691b07e2f')

package() {
  # Make directory
  install -d "${pkgdir}"/opt/min-ed-launcher
  install -d "${pkgdir}"/usr/bin

  # Copy files
  cd "$srcdir/${_pkgname}_${pkgver}_linux-x64"
  install -Dm644 CHANGELOG.md "${pkgdir}"/opt/min-ed-launcher/CHANGELOG.md
  install -Dm755 MinEdLauncher "${pkgdir}"/opt/min-ed-launcher/MinEdLauncher
  install -Dm644 README.md "${pkgdir}"/opt/min-ed-launcher/README.md

  # Make symlink
  ln -sf /opt/min-ed-launcher/MinEdLauncher "${pkgdir}"/usr/bin/MinEdLauncher
  ln -sf /usr/bin/MinEdLauncher "${pkgdir}"/usr/bin/minedlauncher
}
