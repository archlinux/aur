# Maintainer: Jérôme Mulsant <jerome@rue-de-la-vieille.fr>
_appname=kanata-tray
pkgname=kanata-tray-bin
pkgver=0.8.0
pkgrel=1
epoch=
pkgdesc="A simple wrapper for kanata to control it from tray icon."
arch=('x86_64')
url="https://github.com/rszyma/kanata-tray"
license=(GPL-3.0-only)
depends=('libayatana-appindicator')
source=("https://github.com/rszyma/kanata-tray/releases/download/v${pkgver}/kanata-tray-linux"
    "https://github.com/rszyma/kanata-tray/releases/download/v${pkgver}/LICENSE"
    "kanata.svg"
    "kanata-tray.desktop")
noextract=()
sha256sums=('a34b9e3de2c7c7f22be94f62e7ff9c86b468daba38c1e6ea8d6e9e991546f74d'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
            'ded273a6aacf8cf8f6bc031cf82e5a7f40c6824144ed03bcfea6e8480cb36b80'
            '75c41ea6b3b2a12c4420f2931ad90f40ef812668482ea5cfd1b601894ad74703')

package() {
    install -Dm0644 "${srcdir}/kanata.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    install -Dm0644 "${srcdir}/kanata-tray.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_appname}/"
    install -Dm755 "${srcdir}/kanata-tray-linux" "${pkgdir}/usr/bin/${_appname}"
}
