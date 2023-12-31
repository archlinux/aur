# Maintainer: anlorsp <anlor[at]anlor[dot]top>
pkgname=bilibili_manga_downloader-bin
_pkgname=bilibili_manga_downloader
pkgver=3.2.2
pkgrel=1
pkgdesc="基于现代GUI的跨平台哔哩哔哩漫画下载器（支持特典下载）"
arch=('x86_64')
url="https://github.com/MOMOYATW/bilibili_manga_downloader"
license=('MIT')
depends=('gtk3' 'alsa-lib' 'nss')
install="${pkgname}.install"
source=("https://github.com/MOMOYATW/bilibili_manga_downloader/releases/download/v${pkgver}/bilibili-manga-downloader_${pkgver}_linux_amd64.tar.gz"
        "${_pkgname}.png"
        "LICENSE"
        "${_pkgname}.desktop")
sha256sums=('841cc1c8310d8d83d73ddab34864869e4b74c69f5a35bbbc8fb9a5d668ebd815'
            'ef0ef9c1c65b0aa8c3db6c5dde705336ee7725abd97372eba40cfe71be1816be'
            '9d60cfeddb5c57bfa82b7ece15cc0b270badb5d00cbfbf4d66945a77ee28e662'
            '5221e18d15de713a946a57d43c89f0456ce7e95509ae3d65aa60591b8552baae')

package() {
        install -d "${pkgdir}/opt/${_pkgname}"

        install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
        install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

        cp -r "${srcdir}/linux-unpacked/"* "${pkgdir}/opt/${_pkgname}"
}
