# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=skill-validator-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Validate AI agent skills against the Agent Skill specification"
arch=('x86_64' 'aarch64')
url="https://github.com/agent-ecosystem/skill-validator"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/skill-validator_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/skill-validator_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a9b4cb3436682ff8d55dd0d164376c8479d35cb58c0adc3e93170fbde8baa04f')
sha256sums_aarch64=('87dc2f61df60f6c737b29e479a541ad72ee0f9c11422cdd76e7036a7e22e9fbc')

package() {
  install -Dm755 "skill-validator" "${pkgdir}/usr/bin/skill-validator"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
