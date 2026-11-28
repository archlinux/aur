# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=squalr-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Memory scanning and editing tool for games and software"
arch=('x86_64')
url="https://github.com/Squalr/Squalr"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'openssl-3' 'wayland')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Squalr/Squalr/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/squalr-${pkgver}-linux-x86_64.zip")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('5d51b15a8b181bf33f4e3279beaeb6e7860d27538a7cacfe3e7c2d20423a48ed')

package() {
  install -Dm755 "squalr" "${pkgdir}/usr/bin/squalr"
  install -Dm755 "squalr-cli" "${pkgdir}/usr/bin/squalr-cli"
  install -Dm755 "squalr-tui" "${pkgdir}/usr/bin/squalr-tui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
