# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vfox-bin
pkgver=1.0.2
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
sha256sums_aarch64=('7a2c8f468310fc25b1b7af200b54105ca211458a1ae3a6b891b665489fe72caf')
sha256sums_armv7h=('9762d62cf459cf34b3a1c78aee98105c9d12cf0d3d98f419f0fdbcdcb719661a')
sha256sums_i686=('ea532c71c1fe7ba3aacecf1c7d75e591a0ea08f0194118374897f5b9f5df3da2')
sha256sums_x86_64=('42ffd4b3c917fe4200aa325cd86dbe68e92e31b7a0e6a4ae26323ba2a48e9d46')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    if [ -f "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
    fi
}
