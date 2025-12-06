# Maintainer: Saatvik <saatvik333sharma@gmail.com>
pkgname=sddm-theme-obscure-git
pkgver=r1
pkgrel=1
pkgdesc="A minimal SDDM theme with IPA character password masking"
arch=('any')
url="https://github.com/saatvik333/obscure-sddm-theme"
license=('MIT')
depends=('sddm' 'qt6-5compat')
makedepends=('git')
provides=('sddm-theme-obscure')
conflicts=('sddm-theme-obscure')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    
    # Install theme files
    install -dm755 "${pkgdir}/usr/share/sddm/themes/obscure"
    cp -r Main.qml theme.conf metadata.desktop README.md assets "${pkgdir}/usr/share/sddm/themes/obscure/"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
