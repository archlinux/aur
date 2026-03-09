# Maintainer: Lucasion <lucasion@hotmail.com>
pkgname=ionix-openconnect-tools
pkgver=r3.VERSION
pkgrel=1
pkgdesc="CLI utility for managing and connecting to OpenConnect VPN servers"
arch=('any')
url="https://github.com/LucasionGS/openconnect-tools"
license=('MIT')
depends=('bash' 'openconnect' 'iproute2')
optdepends=('openconnect-sso: Required for SSO-based VPN connections')
makedepends=('git')
provides=('ionix-openconnect-tools')
conflicts=('ionix-openconnect-tools')
source=("${pkgname}::git+https://github.com/LucasionGS/openconnect-tools.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    install -Dm755 oc "${pkgdir}/usr/bin/oc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
