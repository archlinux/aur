# Maintainer: Inche Hwang <me [at] coldified [dot] dev>
# Contributor: Alif Zakiansyah As Syauqi <alifzakiansyah10@gmail.com>
pkgname="spoof-dpi-bin"
pkgver=0.10.11
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
        "${pkgname/-bin/}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/${pkgver}/${pkgname/-bin/}-linux-amd64.tar.gz")
noextract=()
md5sums=('9910ed8f7bdfff59ccd66841520f9c3b'
         '981b9407762ef61fd33681c9d9872e52'
         'e1f6858d174b262382b078db452046fa'
         'c0241685a006177ee1160d5030fffbf8')

package() {
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 spoof-dpi "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm 644 spoof-dpi-conf.d "${pkgdir}/etc/conf.d/spoof-dpi"
  install -Dm 644 spoof-dpi.service "${pkgdir}/usr/lib/systemd/system/spoof-dpi.service"
}
