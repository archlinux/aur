# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=codex-bin
_appname=Codex
pkgver=2.0.0_beta.0
pkgrel=2
pkgdesc="A free note-taking software for programmers and Computer Science students"
arch=('x86_64')
url="https://codexnotes.com/"
_githuburl="https://github.com/jcv8000/Codex"
license=('CC-BY-NC-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'mesa' 'pango' 'expat' 'libxfixes' 'nss' 'gtk3' 'libxext' 'libxrandr' 'libxkbcommon' 'libx11' 'dbus' \
    'cairo' 'alsa-lib' 'libxcomposite' 'nspr' 'at-spi2-core' 'libcups' 'glibc' 'libdrm' 'gcc-libs' 'glib2' 'libxdamage' 'libxcb')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb")
sha256sums=('9fa0517e76984715f48b44e6ee90c67183dd7907a02855dec95398bcd8640f26')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm755 "${pkgdir}/opt/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}