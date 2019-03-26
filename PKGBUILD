# Maintainer: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.12.0
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/AdguardTeam/dnsproxy/archive/v0.12.0.tar.gz")
makedepends=("go" "git")
sha256sums=('a9db3de07c13747668cf8837e0db5a85bdca9c79faba3ffc68edeba403338c30')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
}