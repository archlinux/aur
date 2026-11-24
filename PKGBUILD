# Maintainer: Aria Vesta <dev@ariavesta.com>
pkgname=kei-cli-bin
_pkgname=kei-cli
pkgver=0.5.2
pkgrel=1
pkgdesc="Haikei Labs CLI for signing in to Kei, running a runtime and governing coding agents, with kei-proxy (binary release)"
arch=('x86_64' 'aarch64')
url="https://haikeilabs.com"
license=('MIT')
provides=("${_pkgname}=${pkgver}" 'kei-proxy')
conflicts=("${_pkgname}" 'kei-proxy' 'kei')
install="${pkgname}.install"
options=('!strip' '!debug')
_relurl="https://kei-cli-releases.s3.us-east-1.amazonaws.com/${_pkgname}/${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::${_relurl}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::${_relurl}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('1214698aa1bf0342ed44b3c76badc05c8bb68ec679fe1937d7b26945a5e4ba2a')
sha256sums_aarch64=('bc8d431958ed99ebafaa08218a4fd0354812fa2c412240023d1f5421187aee25')

package() {
    install -Dm755 kei "${pkgdir}/usr/bin/kei"
    install -Dm755 kei-proxy "${pkgdir}/usr/bin/kei-proxy"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
