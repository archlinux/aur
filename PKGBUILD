# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentsecrets-bin
pkgver=3.3.7
pkgrel=1
pkgdesc="Zero-knowledge credential infrastructure for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/The-17/agentsecrets"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agentsecrets_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agentsecrets_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ea2b79d616792673b4dc79d00a3fe4897c998d60b9237ec2a5e2ff35e947bf32')
sha256sums_aarch64=('0d985b1809b92e047a02596ebdc27c8098e080c28bddf79143de7e5155272d24')

package() {
  install -Dm755 "agentsecrets" "${pkgdir}/usr/bin/agentsecrets"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
