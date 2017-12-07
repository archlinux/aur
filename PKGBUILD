# Maintainer: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname=vault-client
pkgver=1.1.3
pkgrel=3
pkgdesc="Vault-Client is a command-line interface to HashiCorp's Vault inspired by pass."
arch=(i686 x86_64)
url="https://github.com/adfinis-sygroup/vault-client.git"
license=('GPLv3')
depends=()
makedepends=(git go)
source=("https://github.com/adfinis-sygroup/vault-client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('ab4c0a340f94c42419e5e2d031df5bc20c433045d3281d76140c80430dcc1ac5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export GOPATH="$(pwd)"

    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" prefix=/usr install
}
