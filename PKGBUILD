# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=eadui
pkgbase=$_name-font
pkgname=(otf-$_name-cpal otf-$_name-svg)
pkgver=3.000
pkgrel=1
pkgdesc='A color font with modern and historic modes emulating the medevial scribe Eadui Basan'
arch=(any)
url="https://github.com/psb1558/${pkgbase^}"
license=(OFL)
source=("${_name}-$pkgver.zip::$url/releases/download/v$pkgver/${_name^}.zip")
sha256sums=('c6074b9e9f7415b01fef1ee0ab4e5568ab62294a68d027a76bbdcc2277f62678')

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
