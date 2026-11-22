# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=almavorn-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A customizable music player for both desktop and terminal - choose GUI or TUI version"
arch=('x86_64')
url="https://github.com/Molten-Zharr/Almavorn"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/almavorn-${pkgver}-tui-linux-x86_64.tar.gz")
sha256sums_x86_64=('ff93529e4b0fcc3f8a405a054a931fe9261d1c54a841862db5c776e008f3350f')

package() {
  cd "almavorn-${pkgver}-tui-linux-x86_64"
  install -Dm755 "bin/almavorn-tui" "${pkgdir}/usr/bin/almavorn-tui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.ru.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
