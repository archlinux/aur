# Maintainer: Your Name <your email>

pkgname=brave-wayland-hook
pkgver=1.0.0
pkgrel=1
pkgdesc="A hook for brave-bin to enable Wayland support."
arch=('any')
url="https://github.com/your-repo/brave-wayland-hook"
license=('MIT')
depends=('brave-bin')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("brave-wayland-fix.sh" "brave-wayland.hook")
sha256sums=('dec285fdeaa2ce93973a35acb0ef23b270b3f5c1e0e6ec9a3052d004a07bed97'
            'bc40ba8aa9827678d9b6ebaee6700c3d1a45ba229823d5becc6cddfa119d4d87')

package() {
    install -Dm755 "${srcdir}/brave-wayland-fix.sh" "${pkgdir}/usr/share/brave-wayland-hook/brave-wayland-fix.sh"
    install -Dm644 "${srcdir}/brave-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/brave-wayland.hook"
}
