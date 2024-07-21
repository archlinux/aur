# Maintainer: Inche Hwang <me [at] coldified [dot] dev>
# Contributor: Alif Zakiansyah As Syauqi <alifzakiansyah10@gmail.com>
pkgname="spoof-dpi-bin"
pkgver=0.9
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
        "${pkgname/-bin/}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}/${pkgname/-bin/}-linux.tar.gz")
noextract=()
md5sums=("f932f96c946c400e35d7424cd5b5f584"
  "a7bec6aaea3f609d874c12cc3f7a7644"
  "e1f6858d174b262382b078db452046fa"
  "6cbee7085987192e76fe9b0b39463d72")
# validpgpkeys=()

package() {
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 spoof-dpi "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm 644 spoof-dpi-conf.d "${pkgdir}/etc/conf.d/spoof-dpi"
  install -Dm 644 spoof-dpi.service "${pkgdir}/usr/lib/systemd/system/spoof-dpi.service"
}
