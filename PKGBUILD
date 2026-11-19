# Maintainer: Abdullah Al-Banna

pkgname=rusbmux-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A usbmuxd replacement in pure Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/abdubanna/rusbmux"
license=('MIT' 'Apache-2.0')
install=rusbmux-bin.install
depends=('gcc-libs' 'glibc')
provides=('rusbmux' 'usbmuxd')
conflicts=('usbmuxd')

source_x86_64=("rusbmux-${pkgver}-x86_64.tar.gz::https://github.com/abdubanna/rusbmux/releases/download/v${pkgver}/rusbmux-${pkgver}-x86_64.tar.gz")
source_aarch64=("rusbmux-${pkgver}-aarch64.tar.gz::https://github.com/abdubanna/rusbmux/releases/download/v${pkgver}/rusbmux-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('c925d6cdc32102a91c735527209c0158fc3006d284af15b6c9c7a2851a76dfca')
sha256sums_aarch64=('d9bb3b93485d8a147454fe754f0780b83cae07f76f08c050ca0b283d5da84165')

package() {
  cd "${srcdir}/rusbmux-${pkgver}"

  install -Dm755 "usr/bin/rusbmux" "${pkgdir}/usr/bin/rusbmux"
  install -Dm644 "usr/lib/systemd/system/rusbmux.service" "${pkgdir}/usr/lib/systemd/system/rusbmux.service"
  install -Dm644 "usr/share/doc/rusbmux/README.md" "${pkgdir}/usr/share/doc/rusbmux/README.md"
  install -Dm644 "usr/share/licenses/rusbmux/LICENSE-MIT" "${pkgdir}/usr/share/licenses/rusbmux/LICENSE-MIT"
  install -Dm644 "usr/share/licenses/rusbmux/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/rusbmux/LICENSE-APACHE"
  install -Dm644 "usr/share/licenses/rusbmux/THIRD_PARTY_LICENSES" "${pkgdir}/usr/share/licenses/rusbmux/THIRD_PARTY_LICENSES"
}
