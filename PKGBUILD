# Maintainer: Jeremy Hofer <fuego0607@gmail.com>
pkgname=godot-headless-export-templates-bin
pkgver=3.2.3
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
md5sums=('0370448cf58e9d22b11e0b203ccc8520'
         '672474a6feb20b09de9d04b208cf8f01')

package() {
    install -D -m755 "${srcdir}/Godot_v${pkgver}-stable_linux_headless.64" "${pkgdir}/usr/bin/godot"
    install -d -m755 "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
    cp "${srcdir}/templates/"* "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
}
