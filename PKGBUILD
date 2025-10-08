# Maintainer: Joel Klinghed <the_jk at spawned dot biz>
pkgname=maestro-dev
pkgver=2.0.5
pkgrel=1
pkgdesc="End-to-end testing for Mobile and Web apps"
url="https://maestro.dev"
license=("Apache-2.0")
arch=("any")
depends=("java-runtime-headless>=17" "bash")

source=("https://github.com/mobile-dev-inc/maestro/releases/download/cli-${pkgver}/maestro.zip")
sha256sums=("a24d7d4debcb41f45bdff03703241131dca176e73bab41754036c9b5b3d0b85f")

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/maestro-dev"
    install -dm755 "${pkgdir}/usr/bin"

    # Copy all files from the extracted package
    cp -r "${srcdir}"/maestro/* "${pkgdir}/opt/maestro-dev/"

    # Create symlink in /usr/bin
    ln -s "/opt/maestro-dev/bin/maestro" "${pkgdir}/usr/bin/maestro"
}
