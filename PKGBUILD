# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor (prior maintainer & submitter): twall <tomwallroth at gmail com>

pkgname="ente-cli-bin"
_pkgname="ente-cli"
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI for ente Photos"
arch=('x86_64' 'aarch64')
url="https://github.com/ente-io/ente/tree/main/cli"
_url="https://github.com/ente-io/ente"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
options=('!strip')
source_x86_64=("ente-cli-v${pkgver}-linux-x86_64.tar.gz"::"${_url}/releases/download/cli-v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("ente-cli-v${pkgver}-linux-aarch64.tar.gz"::"${_url}/releases/download/cli-v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('aa79a7b7b9b77df74e1864d919ab1db4de7018a73aac4bc47a01fc7bbd68d7dc')
sha256sums_aarch64=('b367e824d8fdbfc165ba0a150ecc29cf08d3bbbad21870a50f74707725c01f24')

build() {
    tar xf "ente-cli-v${pkgver}-linux-${arch}.tar.gz"
}

package() {
    install -Dm755 ente "${pkgdir}/usr/bin/ente"
}

