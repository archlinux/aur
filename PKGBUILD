# Maintainer: STARRY-S <hxstarrys@gmail.com>
pkgname=wg-healthcheck
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="WireGuard client health-check & auto-reconnect script."
arch=("x86_64" "aarch64")
url="https://github.com/STARRY-S/wg-healthcheck"
license=("MIT")
depends=("bash")
provides=()
source=("https://github.com/STARRY-S/wg-healthcheck/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("4bd4ab275ab4f15034fcf196b1c257b69f82be04f76eb6406da5de365a5a6b2b612e8b5ac6a3c67316db441d558d82ac77e30f8a4f27b43391864a739dde6cb0")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    INSTALL_DIR="${pkgdir}" SYSTEMD_DIR="/usr/lib/systemd/system/" ./install.sh
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
