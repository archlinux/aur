# Maintainer: Marco Migozzi <https://github.com/ToRvaLDz>
pkgname=ii-material-sddm
pkgver=1.0
pkgrel=1
pkgdesc="Material Design 3 SDDM theme inspired by the ii lockscreen from end-4/dots-hyprland"
arch=('any')
url="https://github.com/ToRvaLDz/ii-material-sddm"
license=('GPL-3.0-only')
depends=('sddm')
optdepends=(
    'qt6-5compat: blur effects'
    'acl: automatic matugen color/wallpaper sync'
    'ttf-google-sans: clock and UI font'
)
provides=('ii-material-sddm')
conflicts=('ii-material-sddm-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9d8e0cbebb737a3901bab570a33af6e125ea51207e25a161dc1c92a02b9d43ee')

package() {
    local theme_dir="${pkgdir}/usr/share/sddm/themes/${pkgname}"
    install -d "${theme_dir}/Components" "${theme_dir}/Backgrounds"
    install -m644 "${pkgname}/Main.qml" "${pkgname}/metadata.desktop" \
                  "${pkgname}/theme.conf" "${pkgname}/translations.js" "${theme_dir}/"
    install -m644 "${pkgname}/colors.json" "${theme_dir}/" 2>/dev/null || true
    install -m644 "${pkgname}/Components/"*.qml "${theme_dir}/Components/"
    install -m644 "${pkgname}/Backgrounds/"* "${theme_dir}/Backgrounds/" 2>/dev/null || true
}
