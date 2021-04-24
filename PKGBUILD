# Maintainer: Jeremy Hofer <fuego0607@gmail.com>
pkgname=godot-headless-export-templates-bin
pkgver=3.3
pkgrel=1
pkgdesc="A headless version of the latest official release of the Godot engine and all export templates."
arch=("x86_64")
url="http://www.godotengine.org"
license=("MIT")
provides=("godot")
conflicts=("godot" "godot-git")
source=(
    "https://downloads.tuxfamily.org/godotengine/${pkgver}/Godot_v${pkgver}-stable_linux_headless.64.zip"
    "https://downloads.tuxfamily.org/godotengine/${pkgver}/Godot_v${pkgver}-stable_export_templates.tpz"
)
md5sums=('46b908a8cf1fb325b6f106979ef28b52'
         '420d4928f798df2d2bcea95e0b5452d0')

package() {
    install -D -m755 "${srcdir}/Godot_v${pkgver}-stable_linux_headless.64" "${pkgdir}/usr/bin/godot"
    install -d -m755 "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
    cp "${srcdir}/templates/"* "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
}
