# Maintainer: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.17.0
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
sha256sums=('166084eed4ec9790646d1733e3adae16dd26f4088f98b3f8dbadf31b3aaf31a9')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
}
