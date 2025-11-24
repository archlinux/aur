# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Barnaby Gray <barnaby@pickle.me.uk>

pkgname=cli53
pkgver=0.8.25
pkgrel=3
pkgdesc="Command line tool for Amazon Route 53"
arch=('x86_64' 'aarch64')
url="https://github.com/barnybug/cli53"
license=('MIT')
depends=()
makedepends=('go' 'make')
source=(${pkgname}_${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('7fc01388af416b88f164244e1c7269a122b8203485313970196913982b80e56d')

build() {
    cd "${pkgname}-${pkgver}"
    go build -o "${pkgname}" -ldflags="-s -w ${_flags[*]}" "./cmd/${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
