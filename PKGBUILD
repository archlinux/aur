# Maintainer: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.18.2
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
sha256sums=('2e6bdc4e5c51ac02cbc950911865ea6cb8877f3c28e6ed5b071dcff95605f21d')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
}
