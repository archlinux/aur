# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=eadui
pkgbase=$_name-font
pkgname=(otf-$_name-cpal otf-$_name-svg)
pkgver=3.002
pkgrel=1
pkgdesc='A color font with modern and historic modes emulating the medevial scribe Eadui Basan'
arch=(any)
url="https://github.com/psb1558/${pkgbase^}"
license=(OFL)
_archive="${_name^}-$pkgver"
source=("${_name}-$pkgver.zip::$url/releases/download/v$pkgver/$_archive.zip")
sha256sums=('0aafebf8b98d4cd0889831169eca762c13f319fd6fdaa2498589ee1c631ce086')

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
