# Maintainer: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname=vault-client
pkgver=1.0
pkgrel=1
pkgdesc="Vault-Client is a command-line interface to HashiCorp's Vault inspired by pass."
arch=(i686 x86_64)
url="https://github.com/adfinis-sygroup/vault-client.git"
license=('GPLv3')
depends=()
makedepends=(git go)
source=("https://github.com/adfinis-sygroup/vault-client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('36c33b6320657fa4c13fb9529acb698dcce2a38f934854fe6358b273d0b0d65a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export GOPATH="$(pwd)"

    make install
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 vc "${pkgdir}/usr/bin/vc"
}
