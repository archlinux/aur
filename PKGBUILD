_pkgname=zalo
pkgname=zalo-unofficial-git
pkgver=24.9.1
pkgrel=1
pkgdesc="Unofficial Zalo client for Linux, port from MacOS version"
arch=('x86_64')
url="https://github.com/realdtn2/zalo-linux-unofficial-2024"
license=('custom')
depends=(
    'python'
    'python-pillow'
    'python-pystray'
    'electron22-bin'
)
source=(
    "zalo::git+${url}.git#tag=${pkgver}"
    "zalo.desktop"
    "zalo_py"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
)
options=('!strip' '!purge')
package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/zalo/ZaloZaDark/assets" "${pkgdir}/opt/${_pkgname}/"
    cp -r "${srcdir}/zalo/ZaloZaDark/Zalo" "${pkgdir}/opt/${_pkgname}/"
    install -Dm644 "${srcdir}/zalo.desktop" "${pkgdir}/usr/share/applications/zalo.desktop"
    install -Dm755 "${srcdir}/zalo_py" "${pkgdir}/usr/bin/zalo"
}
