# Maintainer: Joel Klinghed <the_jk at spawned dot biz>
pkgname=maestro-dev
pkgver=2.5.1
pkgrel=1
pkgdesc="End-to-end testing for Mobile and Web apps"
url="https://maestro.dev"
license=("Apache-2.0")
arch=("any")
depends=("java-runtime-headless>=17" "bash")

source=("maestro-${pkgver}.zip::https://github.com/mobile-dev-inc/maestro/releases/download/cli-${pkgver}/maestro.zip")
sha256sums=("2d924bfd37cccabca438a727213648cbfe4f8bb711559ec8e9d199dc09a5ce52")

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/maestro-dev"
    install -dm755 "${pkgdir}/usr/bin"

    # Copy all files from the extracted package
    cp -r "${srcdir}"/maestro/* "${pkgdir}/opt/maestro-dev/"

    # Create symlink in /usr/bin
    ln -s "/opt/maestro-dev/bin/maestro" "${pkgdir}/usr/bin/maestro"
}
