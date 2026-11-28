# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=numasec-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="AI agent for cybersecurity"
arch=('x86_64' 'aarch64')
url="https://github.com/FrancescoStabile/numasec"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/FrancescoStabile/numasec/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/numasec-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/numasec-linux-arm64.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('e722ebee8c4b219e4dc18d8a13fac568ed78eea3c09801c5977f0a8b86b1bcae')
sha256sums_aarch64=('caa4a2199d31a8dfca733a6e04b25fda734fe98daf5932451a1cf18cf6e45b69')

package() {
  install -Dm755 "numasec" "${pkgdir}/usr/bin/numasec"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
