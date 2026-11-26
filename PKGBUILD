# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=alioth-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Experimental virtual machine monitor written from scratch in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/google/alioth"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/google/alioth/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/alioth-linux-x86_64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/alioth-linux-aarch64.tar.xz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('19b4e86b2393e53df6cb20f88a163c295bda0d170fd0e63fba4ae5eb20e3168b')
sha256sums_aarch64=('097fbc4d4d30b47fb3ebd32e0bde7ab49094892f9ef83512cd573f51c9d6b373')

package() {
  install -Dm755 "alioth" "${pkgdir}/usr/bin/alioth"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
