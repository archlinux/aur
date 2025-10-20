# Maintainer: Daniel Bermúdez <archlinux.i5beg at dabg.uk>
pkgname=droid-bin
pkgver=0.21.4
pkgrel=1
pkgdesc="Factory's development agent CLI"
arch=('x86_64' 'aarch64')
url="https://factory.ai"
license=('custom')
depends=('curl' 'xdg-utils' 'ripgrep')
provides=('droid')
conflicts=('droid')
options=('!strip')
source_x86_64=("droid::https://downloads.factory.ai/factory-cli/releases/${pkgver}/linux/x64/droid")
source_aarch64=("droid::https://downloads.factory.ai/factory-cli/releases/${pkgver}/linux/arm64/droid")
sha256sums_x86_64=('dc29fa7b1fa92c93fe3a2aae410ff832a69f453654b473567a197774e54f5c28')
sha256sums_aarch64=('e85e60fffd20ebc16bdde09b8cf2f522fcc83c58c8043e0dffff8a00051dd07b')

package() {
    # Install droid binary
    install -Dm755 "droid" "${pkgdir}/usr/bin/droid"
    
    # Create symlink to system ripgrep in factory bin directory
    install -dm755 "${pkgdir}/usr/lib/factory/bin"
    ln -s /usr/bin/rg "${pkgdir}/usr/lib/factory/bin/rg"
}
