# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=edgevpn-bin
pkgver=0.37.2
pkgrel=1
pkgdesc="sailboat: The immutable, decentralized, statically built p2p VPN without any central server and automatic discovery! Create decentralized introspectable tunnels over p2p with shared tokens"
arch=('x86_64' 'aarch64')
url="https://github.com/mudler/edgevpn"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/edgevpn-v${pkgver}-Linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/edgevpn-v${pkgver}-Linux-arm64.tar.gz")
sha256sums_x86_64=('5992866671468e4134c4a4c6a1ddb4d1fcad33748d6cbd2324a9b8e3f08f2c4f')
sha256sums_aarch64=('ab53f1e49b7e06f087de619b24072ee73bad2d9a65bf800095414431094988c8')

package() {
  install -Dm755 "edgevpn" "${pkgdir}/usr/bin/edgevpn"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
