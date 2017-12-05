# Maintainer: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname=vault-client
pkgver=1.1.3
pkgrel=1
pkgdesc="Vault-Client is a command-line interface to HashiCorp's Vault inspired by pass."
arch=(i686 x86_64)
url="https://github.com/adfinis-sygroup/vault-client.git"
license=('GPLv3')
depends=()
makedepends=(git go)
source=("https://github.com/adfinis-sygroup/vault-client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('87d419d8110be0fce6eec2ad9ebaa437834b5865d442c7a1978045b2c8c5406f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export GOPATH="$(pwd)"

    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}/usr" install
}
