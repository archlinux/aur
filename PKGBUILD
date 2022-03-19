# Maintainer: Jeremy Hofer <fuego0607@gmail.com>
pkgname=godot-headless-export-templates-bin
pkgver=3.4.3
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
sha256sums=('76d5272398619d96787b28bdc18206e6b0378df97e39690c488fb86955acefa9'
            'abb9b60a978149a2dd4391f0917a8be9ad577d37c5f1c9a6308c4c8d2c546de2')
package() {
    install -D -m755 "${srcdir}/Godot_v${pkgver}-stable_linux_headless.64" "${pkgdir}/usr/bin/godot"
    install -d -m755 "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
    cp "${srcdir}/templates/"* "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
}
