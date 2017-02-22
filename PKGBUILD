# Maintainer: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname=vault-client
pkgver=1.0.2
pkgrel=1
pkgdesc="Vault-Client is a command-line interface to HashiCorp's Vault inspired by pass."
arch=(i686 x86_64)
url="https://github.com/adfinis-sygroup/vault-client.git"
license=('GPLv3')
depends=()
makedepends=(git go)
source=("https://github.com/adfinis-sygroup/vault-client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('1aad424a9ce0b37014d2f15bb4fb740774130690e78f928ee85f91e5ccefd04a')

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
