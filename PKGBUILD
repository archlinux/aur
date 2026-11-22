# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=raygun-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A terminal-based receiver for Spatie's Ray debugger"
arch=('x86_64' 'aarch64')
url="https://github.com/yetidevworks/raygun"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yetidevworks/raygun/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/raygun-${pkgver}-linux-x86_64-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/raygun-${pkgver}-linux-aarch64-musl.tar.gz")
sha256sums=('3894231411ec27c0faf5a840ebd7ce47af3c9e74dcc99da35eec091cfc2f19ab')
sha256sums_x86_64=('5ff6c5dc2429ffd3d934e0bcdef9bef9a756e4a61042ff7b1967605f57ca0ab6')
sha256sums_aarch64=('95a8aa71c47b4369ced3371d06f24e3e9d0d6d05870a1c29d048b87abc538230')

package() {
  install -Dm755 "raygun" "${pkgdir}/usr/bin/raygun"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
