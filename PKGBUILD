# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vfox-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A cross-platform and extendable version manager with support for Java, Node.js, Flutter, .Net & more.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://vfox.dev"
_ghurl="https://github.com/version-fox/vfox"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
)
optdepends=(
    'zsh'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_i386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.rpm")
sha256sums_aarch64=('d2c210b9562a7088624d7b4ef50c20bbc4d47c5ec964366eaf0b174af4ad58b3')
sha256sums_armv7h=('ee1f7295cc1b8eb3d2b030fe93d69212c8a1ad43789a4769499ce5cedc33e67e')
sha256sums_i686=('9a6dbe243c88a1af998be8ade87f8c751a6878e8ed58e6ddce447f571cd8be71')
sha256sums_x86_64=('3f40e16560381511eea5352fddcfbb385f0e7e90e9d97340966dffdd4fb7fe9c')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    if [ -f "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
    fi
}
