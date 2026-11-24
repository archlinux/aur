# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=woxi-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Wolfram Language interpreter written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/ad-si/woxi"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/woxi-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/woxi-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('72945f3114220bfc41d6ad5c7456a4ff1a49a1936849197ddc00c85cea97821a')
sha256sums_aarch64=('3747c833e22fdf46e86975c957e39b706de2ce514e3aba6f7c7476ebc7c82f6b')

package() {
  install -Dm755 "woxi" "${pkgdir}/usr/bin/woxi"
  install -Dm644 "license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "readme.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
