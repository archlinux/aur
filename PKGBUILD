# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clausura-bin
pkgver=1.11.1
pkgrel=1
pkgdesc="CI-native agent CLI for deterministic pipeline gating"
arch=('x86_64' 'aarch64')
url="https://github.com/liuyanghejerry/Clausura"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/liuyanghejerry/Clausura/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clausura-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clausura-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('2e26b89e002af54f06397f66e2a4aa3baa72225fbc16e099a69a87439fd6b06e')
sha256sums_x86_64=('b65d055031126c3c3be845a1ad2dac10ab3b012af20257728db7470fd630e136')
sha256sums_aarch64=('358593abaad2337ea345e1e295b84fea31d4a2bc757082cd0377560d5be7765b')

package() {
  install -Dm755 "clausura" "${pkgdir}/usr/bin/clausura"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
