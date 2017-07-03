# Maintainer: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname=vault-client
pkgver=1.1.2
pkgrel=2
pkgdesc="Vault-Client is a command-line interface to HashiCorp's Vault inspired by pass."
arch=(i686 x86_64)
url="https://github.com/adfinis-sygroup/vault-client.git"
license=('GPLv3')
depends=()
makedepends=(git go)
source=("https://github.com/adfinis-sygroup/vault-client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('194626fff19f22d0ace16d8a9695103aee86119981e3e3cde58d9ee9c3179796')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export GOPATH="$(pwd)"

    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}/usr" install
}
