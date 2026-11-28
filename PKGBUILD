# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nami-bin
pkgver=20240902
pkgrel=1
pkgdesc="Decentralized package manager"
arch=('x86_64' 'aarch64')
url="https://github.com/txthinking/nami"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/txthinking/nami/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/nami_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/nami_linux_arm64")
sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
sha256sums_x86_64=('8be104a97494cd3be23deead9bd63b9d5846b3d7c42579d985d7f0420ec4601e')
sha256sums_aarch64=('7c3c55fad9c1abe8a8a4302f8de9089db6bd3bf26bb07059e5161f32f36e26e3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/nami"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
