# Maintainer: Colzry <colzry@foxmail.com>

pkgname=m3u8-downloader-colzry-bin
_pkgname=m3u8-downloader
pkgver=1.2.8
pkgrel=1
pkgdesc="A concise m3u8 video downloader / 一款简洁的 m3u8 视频下载器"
arch=('x86_64')
url="https://github.com/Colzry/m3u8-downloader"
license=('GPL-3.0')

# Tauri 运行在 Linux 上必须的核心依赖
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'cairo'
    'pango'
    'glib2'
    'openssl'
    'libayatana-appindicator'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=("${_pkgname}-${pkgver}.deb::https://github.com/Colzry/m3u8-downloader/releases/download/v${pkgver}/m3u8-downloader_${pkgver}_amd64.deb")

sha256sums=('a68c4bdfdea7de36c38e29286b421744bc0f96de43ab809374d7950454d7ac02')

package() {
    msg2 "Extracting deb package..."
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}/"
    sed -i '$a StartupWMClass=m3u8-downloader' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
