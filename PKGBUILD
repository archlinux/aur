# Maintainer: Daniel Bermúdez <archlinux.i5beg at dabg.uk>
pkgname=droid-bin
pkgver=0.21.4
pkgrel=2
pkgdesc="Factory's development agent CLI"
arch=('x86_64' 'aarch64')
url="https://factory.ai"
license=('custom')
depends=('curl' 'xdg-utils')
provides=('droid')
conflicts=('droid')
options=('!strip')
source_x86_64=(
    "droid::https://downloads.factory.ai/factory-cli/releases/${pkgver}/linux/x64/droid"
    "rg::https://downloads.factory.ai/ripgrep/linux/x64/rg"
)
source_aarch64=(
    "droid::https://downloads.factory.ai/factory-cli/releases/${pkgver}/linux/arm64/droid"
    "rg::https://downloads.factory.ai/ripgrep/linux/arm64/rg"
)
sha256sums_x86_64=(
    'dc29fa7b1fa92c93fe3a2aae410ff832a69f453654b473567a197774e54f5c28'
    'be2476c976342b9216611b4a84c1bc2ec6488ec5c791ea019a132727644ef19c'
)
sha256sums_aarch64=(
    'e85e60fffd20ebc16bdde09b8cf2f522fcc83c58c8043e0dffff8a00051dd07b'
    '26ce6cceb17ac710ee7253c49ea825c618d4f9e49a135d52b4edce336c40f620'
)

package() {
    # Install droid binary
    install -Dm755 "droid" "${pkgdir}/usr/bin/droid"
    
    # Install bundled ripgrep binary into factory bin directory
    install -dm755 "${pkgdir}/usr/lib/factory/bin"
    install -Dm755 "rg" "${pkgdir}/usr/lib/factory/bin/rg"
}
