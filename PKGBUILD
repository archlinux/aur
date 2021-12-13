# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=materia-kde-git
pkgver=20211123.r1.g9192b26
pkgrel=1
pkgdesc="Materia theme for KDE Plasma 5"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/materia-kde"
license=('GPL3')
optdepends=('konsole: For the Konsole color scheme'
            'kvantum-qt5: For the Qt application style'
            'kwin: For the Aurorae theme'
            'materia-gtk-theme: Matching GTK theme'
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
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    make -C "${pkgname%-*}" PREFIX=/usr DESTDIR="${pkgdir}/" install
}
