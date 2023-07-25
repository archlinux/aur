# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-bin
_appname=Monokle
pkgver=2.3.2
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('aarch64' 'x86_64')
uarl="https://monokle.io/"
_githuburl="https://github.com/kubeshop/monokle"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'at-spi2-core' 'alsa-lib' 'expat' 'libxcomposite' 'libdrm' 'libxkbcommon' \
    'nodejs' 'gtk3' 'glib2' 'nspr' 'mesa' 'libxrandr' 'cairo' 'nss' 'dbus' 'libxext' 'python' 'libx11' 'pango' 'sh' 'libcups' \
    'libxfixes' 'libxdamage' 'libxcb')
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/kubeshop/monokle/main/LICENSE")
sha256sums=('7a89ae90e9c88d5de936743c0432f43051d79d286aff3c4e669b2b3252b84528')
sha256sums_aarch64=('9ec854a6887ecd2b9ba34ae0c2b64e291180c87523565f3be999bae4f5303d9d')
sha256sums_x86_64=('64dc20b166abb7716a786f073ff559fc905bd20baac968b3f25777d12e0d21dd')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}