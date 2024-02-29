# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
# Some of the code is nicely borrowed from godot-export-templates-git

pkgname=godot3-export-templates
pkgver=3.5.3
pkgrel=1
pkgdesc='Godot export templates for version 3'
url='https://godotengine.org/'
license=('MIT')
arch=('i686' 'x86_64')
optdepends=(
  'godot3: use the templates'
  'godot3-mono: use the templates'
)

source=(
  "https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_export_templates.tpz"
  "LICENSE::https://raw.githubusercontent.com/godotengine/godot/3.5/LICENSE.txt"
)
sha256sums=(
  ae3c1f6fbd431b9e3b67c1f9e42539a6d270a0ccc35558f13072f04b968312d1
  b0435e3b3e4e55238f05f4b306f30524a1b2e20147810d436eaa554fa6855c80
)

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"

  install -Dm755 templates/linux_x11_64_debug "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"
  install -Dm755 templates/linux_x11_64_release "${pkgdir}/usr/share/godot/templates/${pkgver}.stable"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

