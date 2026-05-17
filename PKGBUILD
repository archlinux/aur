# Maintainer: xCaptaiN09 <https://github.com/xCaptaiN09>

pkgname=echo-sddm-git
pkgver=r9.94e0bf3
pkgrel=1
pkgdesc="macOS Terminal-inspired SDDM login theme — frosted glass, real boot animation, dual login modes"
arch=('any')
url="https://github.com/xCaptaiN09/echo-sddm"
license=('MIT')
install=echo-sddm.install
depends=('sddm' 'qt6-declarative' 'qt6-5compat')
optdepends=('ttf-jetbrains-mono: recommended font')
source=("git+https://github.com/xCaptaiN09/echo-sddm.git")
sha256sums=('SKIP')

pkgver() {
    cd echo-sddm
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "${pkgdir}/usr/share/sddm/themes/echo"
    cp -r "${srcdir}/echo-sddm/"{Main.qml,metadata.desktop,theme.conf,assets} \
        "${pkgdir}/usr/share/sddm/themes/echo/"
    install -Dm644 "${srcdir}/echo-sddm/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

