# Maintainer: Alberto Rosario <https://github.com/arosario513>
# Upstream author: Ai Ho (j3ssie) <https://github.com/j3ssie>
pkgname=osmedeus-bin
pkgver=4.7.0
pkgrel=1
pkgdesc="A Workflow Engine for Offensive Security"
provides=('osmedeus')
arch=('x86_64')
url="https://github.com/j3ssie/osmedeus"
license=('MIT')
depends=('glibc')
optdepends=('nmap: for network scanning' 'metasploit: for exploitation modules' 'docker: for isolated tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j3ssie/osmedeus/releases/download/v${pkgver}/osmedeus_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fabb2d2a0729d6c39bea83fd9cd7d8dee31f80cf7586298b399b20001b36ef5d')

package() {
    install -Dm755 "${srcdir}/osmedeus" "${pkgdir}/usr/bin/osmedeus"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

