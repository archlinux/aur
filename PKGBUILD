# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xsubfind3r-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Discover subdomains for a given domain"
arch=('x86_64' 'aarch64')
url="https://github.com/hueristiq/xsubfind3r"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xsubfind3r_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xsubfind3r_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('181a27e5eb318cb969b1c65635e8727fabab73b5a0b2399c54438713bb373387')
sha256sums_aarch64=('b967c02107031e77767b47ed0d0af565229032b0001d20ee7e84b52bbb8fbfec')

package() {
  install -Dm755 "xsubfind3r" "${pkgdir}/usr/bin/xsubfind3r"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
