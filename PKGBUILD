# Maintainer: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.18.1
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
sha256sums=('62a43d4ebdc705234319063220ab639cdee697c1c6cbe1bba0502e5be735831d')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
}
