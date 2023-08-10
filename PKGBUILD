# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-bin
_appname=Monokle
pkgver=2.3.3
pkgrel=2
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('aarch64' 'x86_64')
uarl="https://monokle.io/"
_githuburl="https://github.com/kubeshop/monokle"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'at-spi2-core' 'alsa-lib' 'expat' 'libxcomposite' 'libdrm' 'libxkbcommon' \
    'gtk3' 'glib2' 'nspr' 'mesa' 'libxrandr' 'cairo' 'nss' 'dbus' 'libxext' 'python' 'libx11' 'pango' 'sh' 'libcups' 'libxcb' \
    'libxfixes' 'libxdamage')
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/kubeshop/monokle/main/LICENSE")
sha256sums=('7a89ae90e9c88d5de936743c0432f43051d79d286aff3c4e669b2b3252b84528')
sha256sums_aarch64=('323525e3a6aea7b2822e0f2505b9225aac76928f10542a3c3348049fcf4fb337')
sha256sums_x86_64=('2da3d1fffc9ab1ce0c3433f4fcc603d59744311913fefd6d9117d9910c6675db')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}