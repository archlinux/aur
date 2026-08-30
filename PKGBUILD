# Maintainer: Abdullah Al-Banna

pkgname=rusbmux-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A usbmuxd replacement in pure Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/abdullah-albanna/rusbmux"
license=('MIT' 'Apache-2.0')
install=rusbmux-bin.install
depends=('gcc-libs' 'glibc')
provides=('rusbmux' 'usbmuxd')
conflicts=('usbmuxd')

source_x86_64=("rusbmux-${pkgver}-x86_64.tar.gz::https://github.com/abdullah-albanna/rusbmux/releases/download/v${pkgver}/rusbmux-${pkgver}-x86_64.tar.gz")
source_aarch64=("rusbmux-${pkgver}-aarch64.tar.gz::https://github.com/abdullah-albanna/rusbmux/releases/download/v${pkgver}/rusbmux-${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('0a71d402a1cf8510f334ed166d28631b3332d73593057dee92c773c0264b9a21')
sha256sums_aarch64=('7edf4b442b6065765561c9c46894f8b7152eb267749c07117e5beafec1917e09')

package() {
  cd "${srcdir}/rusbmux-${pkgver}"

  install -Dm755 "usr/bin/rusbmux" "${pkgdir}/usr/bin/rusbmux"
  install -Dm644 "usr/lib/systemd/system/rusbmux.service" "${pkgdir}/usr/lib/systemd/system/rusbmux.service"
  install -Dm644 "usr/share/doc/rusbmux/README.md" "${pkgdir}/usr/share/doc/rusbmux/README.md"
  install -Dm644 "usr/share/licenses/rusbmux/LICENSE-MIT" "${pkgdir}/usr/share/licenses/rusbmux/LICENSE-MIT"
  install -Dm644 "usr/share/licenses/rusbmux/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/rusbmux/LICENSE-APACHE"
  install -Dm644 "usr/share/licenses/rusbmux/THIRD_PARTY_LICENSES" "${pkgdir}/usr/share/licenses/rusbmux/THIRD_PARTY_LICENSES"
}
