# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dtlspipe-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Generic DTLS wrapper for UDP sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/SenseUnit/dtlspipe"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/SenseUnit/dtlspipe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/dtlspipe.linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/dtlspipe.linux-arm64")
sha256sums=('d0e15af2688f9ee3db8b4cf033b04fc1dcae804b671cbb8bd86a756dab2d6cb6')
sha256sums_x86_64=('b361e1c48369304fe1ea704fb88b48f47cd7a8edc37c285ab98f21fa63f8ce4f')
sha256sums_aarch64=('96e958df6f16ea2ebc6fb3b1a3f342cb1ce4f3908f089da6d9e67a6c2772f352')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/dtlspipe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
