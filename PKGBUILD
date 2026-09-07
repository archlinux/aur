# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vfox-bin
pkgver=1.0.12
pkgrel=1
pkgdesc="A cross-platform and extendable version manager with support for Java, Node.js, Golang, Python, Flutter, .NET & more."
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
sha256sums_aarch64=('335d74c9f3754bdb7d22c9f06028f1133711b373a00ff01ad11136a53589c8c1')
sha256sums_armv7h=('038e0961790bfa405bc733b763198e96b55b850e2732d825712a4a1a97a21a25')
sha256sums_i686=('e6ec3ee2d1d325f5b8acc359efa3535ad1a60a4b702c5654a3d2ae68189ca665')
sha256sums_x86_64=('19b244fd45a686af477d4b28c96a7f26736eb3da02135eb80a39fce0481d7eef')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    if [ -f "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
    fi
}
