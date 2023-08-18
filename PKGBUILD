# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=m3u8-downloader-bin
_pkgname=M3U8-Downloader
pkgver=2.2.5
pkgrel=1
pkgdesc="M3U8-Downloader, electron, multi-threading, resumable upload, encrypted video download cache."
arch=("x86_64")
url="https://github.com/12343954/M3U8-Downloader"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxcomposite' 'mesa' 'glibc' 'at-spi2-core' 'libxfixes' 'libcups' 'libx11' 'libxcb' 'nspr' 'libxdamage' 'gcc-libs' \
    'glib2' 'pango' 'libdrm' 'expat' 'libxext' 'libxkbcommon' 'cairo' 'alsa-lib' 'hicolor-icon-theme' 'dbus' 'nss' 'libxrandr' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}-linux_amd64-${pkgver}.deb")
sha256sums=('ddf17b003553100ac63227621229ed7898d9960606459589ddceceecc57f8c94')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}