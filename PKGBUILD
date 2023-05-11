# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monokle-bin
_appname=Monokle
pkgver=2.1.0
pkgrel=1
pkgdesc="Lets you create, analyze, and deploy YAML manifests with a visual UI, and provides policy validation and cluster management."
arch=('x86_64')
uarl="https://monokle.io/"
_githuburl="https://github.com/kubeshop/monokle"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'at-spi2-core' 'alsa-lib' 'expat' 'libxcomposite' 'libdrm' 'libxkbcommon' \
    'nodejs' 'gtk3' 'glib2' 'nspr' 'mesa' 'libxrandr' 'cairo' 'nss' 'dbus' 'libxext' 'python' 'libx11' 'pango' 'sh' 'libcups' \
    'libxfixes' 'libxdamage' 'libxcb')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/kubeshop/monokle/main/LICENSE")
sha256sums=('b4c7667726c5024b22649a6a5dd18021b70af9a21e37a04eb301304c8cddcecc'
            '7a89ae90e9c88d5de936743c0432f43051d79d286aff3c4e669b2b3252b84528')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}