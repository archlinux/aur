# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=madmail-bin
pkgver=2.42.0
pkgrel=1
pkgdesc="Lightweight PGP-only mail server for Delta Chat"
arch=('x86_64' 'aarch64')
url="https://github.com/themadorg/madmail"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/themadorg/madmail/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/madmail-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/madmail-linux-arm64.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('95e98538791abe9c7842cc385191f0b3364c08421d708ea05c5457c78de8d1ec')
sha256sums_aarch64=('e20b9ad02cd4db43e3a5587cb11787199a693978186275ceb212774a890d59b5')

package() {
  install -Dm755 "madmail" "${pkgdir}/usr/bin/madmail"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
