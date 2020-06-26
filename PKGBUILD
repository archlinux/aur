# Maintainer: Jeremy Hofer <fuego0607@gmail.com>
pkgname=godot-headless-export-templates-bin
pkgver=3.2.2
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
md5sums=('24117afe9416942663280b2e9bf67462'
         'e4dae26930a8f929f2d3988dd3f74791')

package() {
    install -D -m755 "${srcdir}/Godot_v${pkgver}-stable_linux_headless.64" "${pkgdir}/usr/bin/godot"
    install -d -m755 "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
    cp "${srcdir}/templates/"* "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
}
