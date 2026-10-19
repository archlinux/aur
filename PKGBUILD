# Maintainer: Mikele <mikele@gmail.com>

pkgname=cdduck-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="TUI file browser that replaces cd in the terminal"
arch=('x86_64')
url="https://github.com/mikelexp/CDDuck"
license=('MIT')
depends=('glibc')
provides=('cdduck')
conflicts=('cdduck')
install=cdduck.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/cdduck-${pkgver}-linux-x86_64.tar.gz")
# Placeholder checksum; scripts/aur-update.sh replaces this before publishing to AUR.
sha256sums=('79b451fdbeb83cd10ac2c9582c4fd859aee810377f16c909bc83bec26012abb0')

package() {
  cd "${srcdir}"

  install -Dm755 cdduck "${pkgdir}/usr/bin/cdduck"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
