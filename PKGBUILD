# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cerbos-bin
pkgver=0.58.0
pkgrel=1
pkgdesc="Cerbos is an open-core authorization management platform for authorizing every identity and governing every action across applications, gateways, workloads, and AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/cerbos/cerbos"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cerbos_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cerbos_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('df958663827300e70c7fe2f95867a8291f4f4b9c99524b46762b7b62bbcaf0d9')
sha256sums_aarch64=('741ee9a41eb5cbce2987ef289cc4c817e17911cc0443f95f9988ebb2e1b32596')

package() {
  install -Dm755 "cerbos" "${pkgdir}/usr/bin/cerbos"
  install -Dm755 "cerbosctl" "${pkgdir}/usr/bin/cerbosctl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
