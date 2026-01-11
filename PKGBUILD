# Maintainer: Val V <scm(at)vaygr(dot)net>

pkgname=fabric-ai-bin
_pkgname=fabric
pkgver=1.4.375
pkgrel=1
pkgdesc="open-source framework for augmenting humans using AI (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/danielmiessler/fabric"
license=('MIT')
provides=('fabric-ai')
conflicts=('fabric-ai')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")

sha256sums_x86_64=('a1441a544025df725fc3db206d97b383a37f7c874c9a7feb12c4815274da8519')
sha256sums_aarch64=('f801fdfe8fd603878159d92685aa2ae2e855c65f9c3f033ba83d07178f6f16e1')

package() {
  install -Dm755 fabric "${pkgdir}/usr/bin/fabric-ai"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
