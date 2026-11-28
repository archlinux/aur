# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=event-generator-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Generate suspicious actions detected by Falco rulesets"
arch=('x86_64' 'aarch64')
url="https://github.com/falcosecurity/event-generator"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/event-generator_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/event-generator_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('80dcf3c6eac2ec84300872dafeb76c49d9a11cbb16a9ea3ba3f9bb7362a5cedf')
sha256sums_aarch64=('ab4f0dff588f9186ce4d092c787ab0a4cf79b7283368c1dffa096b58e584a54b')

package() {
  install -Dm755 "event-generator" "${pkgdir}/usr/bin/event-generator"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
