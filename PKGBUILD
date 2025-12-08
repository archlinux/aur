# Maintainer: Plague Doctor <plague@privacyrequired.com>
pkgname=venice-cli-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Command-line interface for venice.ai - privacy-focused AI with interactive chat"
arch=('x86_64')
url="https://gitlab.com/Plague_Doctor/venice-cli"
license=('GPL-3.0-only')
options=('!debug')  # Skip debug symbol processing for Go binaries
depends=()  # No runtime dependencies for static Go binary
provides=('venice-cli')
conflicts=('venice-cli')
source_x86_64=("venice-linux-amd64-${pkgver}::https://gitlab.com/api/v4/projects/76426846/packages/generic/venice-cli/v${pkgver}/venice-linux-amd64")
sha256sums_x86_64=('2fc58332a80a2572282359e7c33a00082c6893bbd0128fd5a8396561a3d07e96')

package() {
    # Install binary
    install -Dm755 "${srcdir}/venice-linux-amd64-${pkgver}" \
        "${pkgdir}/usr/bin/venice-cli"
}

