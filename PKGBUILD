# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xurlfind3r-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Discover URLs for a given domain"
arch=('x86_64' 'aarch64')
url="https://github.com/hueristiq/xurlfind3r"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xurlfind3r_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xurlfind3r_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f39121ba19c9be5aeced27d168be0ac4bdcf8ad8763a3b86219eb1b29632d6c0')
sha256sums_aarch64=('3552140a386399134c6d469c6c662014f9854776d953b1047038d803a108606b')

package() {
  install -Dm755 "xurlfind3r" "${pkgdir}/usr/bin/xurlfind3r"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
