# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=materia-kde-git
pkgver=r11.ga9ac104
pkgrel=1
pkgdesc="Port of the popular GTK theme Materia for Plasma 5 desktop with a few additions and extras"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/materia-kde"
license=('GPL3')
optdepends=('konsole: For the Konsole color scheme'
            'kvantum-qt5: For the Qt application style'
            'kwin: For the Aurorae theme'
            'papirus-icon-theme: For the Papirus icon theme'
            'plasma-desktop: For the Plasma theme'
            'yakuake: For the Yakuake skin')
makedepends=('git' 'make')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
options=(!strip)
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    make -C "${pkgname%-*}" PREFIX=/usr DESTDIR="${pkgdir}/" install
}
