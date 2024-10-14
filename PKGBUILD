# Maintainer: claymorwan <claymorw@gmail.com> <claymorwan@proton.me>

_sourceName="kde_controlcentre"
_plasmoidName="com.github.prayag2.controlcentre"

pkgname=plasma6-kde_controlcentre
pkgver=0.1.0
pkgrel=2
pkgdesc="A beautiful control centre widget for KDE Plasma directly inspired by the MacOS control centre. Made by Prayag2"
arch=("any")
url="https://github.com/Prayag2/kde_controlcentre"
source=("git+${url}")
sha256sums=("SKIP")
license=("GPL-3.0-only")
depends=(
    "plasma-nm" "kdeplasma-addons" "plasma-pa" "kirigami" "kcmutils" "plasma5support" "ksvg" "plasma-workspace" "kiconthemes" "libplasma" 
    "qt6-5compat" "qt6-declarative" 
    "kdeconnect" "bluez-qt" "powerdevil"
)
makedepends=("git" "kpackage5")

package() {
    cd "${_sourceName}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    kpackagetool5 -p "${pkgdir}/usr/share/plasma/plasmoids/" -t Plasma/Applet -i package
}
