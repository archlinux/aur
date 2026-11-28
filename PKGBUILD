# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herdr-auto-title-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Automatically name herdr tabs and panes from your current work"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptamine/herdr-auto-title"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kryptamine/herdr-auto-title/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/herdr-auto-title-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/herdr-auto-title-linux-arm64")
sha256sums=('6db43ac2a348403a4b2fdb31cb1ee4155f8d70aa08c5b34cc6c07b93d7d3f62b')
sha256sums_x86_64=('14ae40fdf0e7c8e27ada73da8af6e5d4d5308d95b8df3758987ab315b9f50cf2')
sha256sums_aarch64=('9bfad7fcb79bbf7092828467f09fec0fb92abc66aa7d77be487908262c608a09')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr-auto-title"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
