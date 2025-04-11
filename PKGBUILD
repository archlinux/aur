# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vfox-bin
pkgver=0.6.5
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
sha256sums_aarch64=('0cd0382f4791e8c3a80743f2b10bd7b7b1627966a0bb48595e8abfd538dbc4b1')
sha256sums_armv7h=('e6da86014c35906891a6447b776ec510ea3516f2061f98d6a7820bc8a86cd2ff')
sha256sums_i686=('935161910787f9aee3e79a2f6acfa7343e1d17b596a257c910ab1e650e993e03')
sha256sums_x86_64=('fe7578dadddbf1a8d5947ab46ddb087e1e4ae4598892308677fc39f5f8cca965')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
}