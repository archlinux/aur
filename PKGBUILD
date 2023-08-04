# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zyplayer-bin
pkgver=3.2.6
pkgrel=1
pkgdesc="跨平台桌面端视频资源播放器,免费高颜值"
arch=("aarch" "x86_64")
url="https://github.com/Hiram-Wong/ZyPlayer"
license=("MIT")
depends=('libcups' 'libxcomposite' 'nss' 'nspr' 'dbus' 'libxext' 'gcc-libs' 'pango' 'libxdamage' 'libxcb' 'libxkbcommon' \
    'libxfixes' 'libx11' 'libxrandr' 'expat' 'glib2' 'alsa-lib' 'libdrm' 'mesa' 'gtk3' 'at-spi2-core' 'cairo' 'glibc' 'hicolor-icon-theme')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch=("${pkgname%-bin}-${pkgver}-aarch.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/Hiram-Wong/ZyPlayer/main/LICENSE")
sha256sums=('84378c42abc60e52c641be1d9d3b5b74e587adbfce6a1be75276524120055edd')
sha256sums_aarch=('cf3790493a3771fa0a681e6f520e0f4e3a2095da533d4363fa56a75524240a78')
sha256sums_x86_64=('b7a345285c045ffa93c8b1cf70ea948a4370fef6793e311165a177ed90113c74')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}