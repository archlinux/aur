# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=des-talk-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="A ChatGPT clone for desktop made with Tauri and React.js"
arch=('x86_64')
url="https://github.com/Red-Spaces/DesTalk"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin//-/}")
depends=('hicolor-icon-theme' 'gtk3' 'pango' 'webkit2gtk' 'gdk-pixbuf2' 'libsoup' 'gcc-libs' 'glibc' 'cairo' 'glib2')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Red-Spaces/DesTalk/stable/LICENSE")
sha256sums=('7ea8c24dfb47a1f10e09eb2cb0e6cb33d51192b9f4a2ddcda38d469030e7166c'
            '9f0d47ac26c0c5a6780c541ad8a392ec796c9933abf93260595ed641d8e623f2')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}