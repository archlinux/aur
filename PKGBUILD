# Maintainer: Jeremy Hofer <fuego0607@gmail.com>
pkgname=godot-headless-export-templates-bin
pkgver=3.4.2
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
sha256sums=('2f7729bb261561cec798be4361504c603e08d00bfa187ef02463d5d4411ac5d8'
            '98875680e61858e7775b0da3181b73df69385dd19abf318082a9c4416699f783')

package() {
    install -D -m755 "${srcdir}/Godot_v${pkgver}-stable_linux_headless.64" "${pkgdir}/usr/bin/godot"
    install -d -m755 "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
    cp "${srcdir}/templates/"* "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
}
