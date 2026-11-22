# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sharad_ratatui-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="A text-based Shadowrun role-playing game"
arch=('x86_64')
url="https://github.com/ProHaller/sharad_ratatui"
license=('Apache-2.0')
depends=('alsa-lib' 'glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/sharad_ratatui-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('4f8fdd9bb924789b27d9afc0791e26fbb74902b8b0f1d08fc0f578a11a2cfb48')

package() {
  cd "sharad_ratatui-x86_64-unknown-linux-gnu"
  install -Dm755 "sharad_ratatui" "${pkgdir}/usr/bin/sharad_ratatui"
  install -Dm644 "LICENSE-MIT.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
