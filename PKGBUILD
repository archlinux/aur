# Maintainer: Inche Hwang <me [at] coldified [dot] dev>
# Contributor: Alif Zakiansyah As Syauqi <alifzakiansyah10@gmail.com>
pkgname="spoof-dpi-bin"
pkgver=0.10.4
pkgrel=1
# epoch=
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(x86_64)
url="https://github.com/xvzc/SpoofDPI"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(spoof-dpi)
conflicts=(spoof-dpi)
replaces=()
backup=()
options=()
install=
changelog=
source=("spoof-dpi-conf.d"
        "spoof-dpi.service"
        "${url}/raw/main/LICENSE"
        "${pkgname/-bin/}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}-linux-amd64.tar.gz")
noextract=()
md5sums=('9e669460dab01e3338a003db7ca2a16a'
         '981b9407762ef61fd33681c9d9872e52'
         'e1f6858d174b262382b078db452046fa'
         '1412512d4a244a032eb0e7f3c6558b30')
# validpgpkeys=()

package() {
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 spoof-dpi "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm 644 spoof-dpi-conf.d "${pkgdir}/etc/conf.d/spoof-dpi"
  install -Dm 644 spoof-dpi.service "${pkgdir}/usr/lib/systemd/system/spoof-dpi.service"
}
