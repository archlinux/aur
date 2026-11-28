# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=uhyve-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Specialized hypervisor for Hermit unikernels"
arch=('x86_64')
url="https://github.com/hermit-os/uhyve"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/uhyve-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('aaeda2529441ef33152210b41a46a2ffc1a1494e9f7e74de323a3c8e04adb2b7')

package() {
  install -Dm755 "uhyve" "${pkgdir}/usr/bin/uhyve"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
