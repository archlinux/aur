# Maintainer: Tai Lam <taivlam-aur-mpr [dot] tinsmith796 [at] silomails [dot] com>
# Contributor (prior maintainer & submitter): twall <tomwallroth at gmail com>

pkgname="ente-cli-bin"
_pkgname="ente-cli"
pkgver=0.4.4
pkgrel=1
pkgdesc="CLI for ente Photos, Auth, and Locker"
arch=('x86_64' 'aarch64')
url="https://github.com/ente/ente/tree/main/cli"
_url="https://github.com/ente/ente"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
options=('!strip')
source_x86_64=("ente-cli-v${pkgver}-linux-x86_64.tar.gz"::"${_url}/releases/download/cli-v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("ente-cli-v${pkgver}-linux-aarch64.tar.gz"::"${_url}/releases/download/cli-v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('719834d6b65e9e48a4a1d4e3e577247633f0e8a5eb2bae30278ec6c6fc536f17')
sha256sums_aarch64=('c51e5ece5617ad7bb4cf6148c6a58b4364db448f7b1594c00b250efc88e40735')

build() {
    tar xf "ente-cli-v${pkgver}-linux-${arch}.tar.gz"
}

package() {
    install -Dm755 ente "${pkgdir}/usr/bin/ente"
}
