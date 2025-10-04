# Maintainer: Daniel Bermúdez <archlinux.i5beg at dabg.uk>
pkgname=droid-bin
pkgver=0.18.2
pkgrel=1
pkgdesc="Factory's development agent CLI"
arch=('x86_64' 'aarch64')
url="https://factory.ai"
license=('custom')
depends=('curl')
optdepends=('xdg-utils: for proper functionality')
provides=('droid')
conflicts=('droid')
options=('!strip')  # ← ADD THIS LINE - don't strip the binary
source_x86_64=("droid::https://downloads.factory.ai/factory-cli/releases/${pkgver}/linux/x64/droid"
               "rg::https://downloads.factory.ai/ripgrep/linux/x64/rg")
source_aarch64=("droid::https://downloads.factory.ai/factory-cli/releases/${pkgver}/linux/arm64/droid"
                "rg::https://downloads.factory.ai/ripgrep/linux/arm64/rg")
sha256sums_x86_64=('SKIP' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')

package() {
    # Install droid binary
    install -Dm755 "droid" "${pkgdir}/usr/bin/droid"
    
    # Install ripgrep to factory bin directory
    install -Dm755 "rg" "${pkgdir}/usr/lib/factory/bin/rg"
}
