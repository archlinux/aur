# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor (prior maintainer & submitter): twall <tomwallroth at gmail com>

pkgname="ente-cli-bin"
_pkgname="ente-cli"
pkgver=0.2.3
pkgrel=4
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
sha256sums_x86_64=('a4fbd1f5884fadc5f48b2798f1bbb447dff3e42e00de11e293b5e815828e6703')
sha256sums_aarch64=('115e0acf9427124edacbda42d806a7071ad3c3394e6e858da100c7307899169b')

build() {
    tar xf "ente-cli-v${pkgver}-linux-${arch}.tar.gz"
}

package() {
    install -Dm755 ente "${pkgdir}/usr/bin/ente"
}

