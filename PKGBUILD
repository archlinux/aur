# Maintainer: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname=vault-client
pkgver=1.1.0
pkgrel=2
pkgdesc="Vault-Client is a command-line interface to HashiCorp's Vault inspired by pass."
arch=(i686 x86_64)
url="https://github.com/adfinis-sygroup/vault-client.git"
license=('GPLv3')
depends=()
makedepends=(git go)
source=("https://github.com/adfinis-sygroup/vault-client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('40afe2757da60fc9f3a96464bc2a91e1a936d578582aba71e5a428b7e2c0e043')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export GOPATH="$(pwd)"

    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 vc "${pkgdir}/usr/bin/vc"
    install -Dm644 sample/vc-completion.bash "${pkgdir}/usr/share/bash-completion/completions/vc"
}
