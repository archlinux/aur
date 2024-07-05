# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=eadui
pkgbase=$_name-font
pkgname=(otf-$_name-cpal otf-$_name-svg)
pkgver=3.001
pkgrel=1
pkgdesc='A color font with modern and historic modes emulating the medevial scribe Eadui Basan'
arch=(any)
url="https://github.com/psb1558/${pkgbase^}"
license=(OFL)
source=("${_name}-$pkgver.zip::$url/releases/download/v$pkgver/${_name^}.zip")
sha256sums=('9a388ae16fc0b5dd13fd8aa42d2f8a580959066bcd58021c45c40031cddae0eb')

package_otf-eadui-cpal() {
    provides=("$pkgbase" "${pkgname%-cpal}")
    replaces=("ttf-eadui")
    cd "${_name^}"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" Eadui-CPAL.otf
}

package_otf-eadui-svg() {
    provides=("$pkgbase" "${pkgname%-svg}")
    replaces=("ttf-eadui")
    cd "${_name^}"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" Eadui-SVG.otf
}
