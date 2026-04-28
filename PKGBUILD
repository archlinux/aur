# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Barnaby Gray <barnaby@pickle.me.uk>

pkgname=cli53
pkgver=0.9.0
pkgrel=1
pkgdesc="Command line tool for Amazon Route 53"
arch=('x86_64' 'aarch64')
url="https://github.com/barnybug/cli53"
license=('MIT')
depends=()
makedepends=('go' 'make')
source=(${pkgname}_${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('4dc4c3c552a0e045015d734d9505e120db879157cbaa3540f3090559df001ce0')

build() {
    cd "${pkgname}-${pkgver}"
    go build -o "${pkgname}" -ldflags="-s -w ${_flags[*]}" "./cmd/${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
