# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=whitesur-wallpapers-git
pkgname=({1080p,2k,4k}-${pkgbase})
pkgver=r15.5c1d7ca
pkgrel=1
pkgdesc="macOS wallpapers which will change according to time"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-wallpapers"
license=('MIT')
makedepends=('git')
source=(${pkgbase}::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgbase}"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare(){
    sed -i 's|@BACKGROUNDDIR@|/usr/share/backgrounds|g' ${pkgbase}/xml-files/gnome-background-properties/*.xml
    sed -i 's|@BACKGROUNDDIR@|/usr/share/backgrounds|g' ${pkgbase}/xml-files/timed-xml-files/*.xml
}

package_1080p-whitesur-wallpapers-git() {
    mkdir -p "${pkgdir}/usr/share/gnome-background-properties"
    mkdir -p "${pkgdir}/usr/share/backgrounds/WhiteSur"
    mkdir -p "${pkgdir}/usr/share/backgrounds/Monterey"
    cd "${pkgbase}"
    cp -rf "xml-files/gnome-background-properties/WhiteSur.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/gnome-background-properties/Monterey.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/timed-xml-files/WhiteSur-timed.xml" "${pkgdir}/usr/share/backgrounds/WhiteSur"
    cp -rf "xml-files/timed-xml-files/Monterey-timed.xml" "${pkgdir}/usr/share/backgrounds/Monterey"
    cp -rf 1080p/Monterey* "${pkgdir}/usr/share/backgrounds/Monterey"
    cp -rf 1080p/WhiteSur* "${pkgdir}/usr/share/backgrounds/WhiteSur"
}

package_2k-whitesur-wallpapers-git() {
    mkdir -p "${pkgdir}/usr/share/gnome-background-properties"
    mkdir -p "${pkgdir}/usr/share/backgrounds/WhiteSur"
    mkdir -p "${pkgdir}/usr/share/backgrounds/Monterey"
    cd "${pkgbase}"
    cp -rf "xml-files/gnome-background-properties/WhiteSur.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/gnome-background-properties/Monterey.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/timed-xml-files/WhiteSur-timed.xml" "${pkgdir}/usr/share/backgrounds/WhiteSur"
    cp -rf "xml-files/timed-xml-files/Monterey-timed.xml" "${pkgdir}/usr/share/backgrounds/Monterey"
    cp -rf 2k/Monterey* "${pkgdir}/usr/share/backgrounds/Monterey"
    cp -rf 2k/WhiteSur* "${pkgdir}/usr/share/backgrounds/WhiteSur"
}

package_4k-whitesur-wallpapers-git() {
    mkdir -p "${pkgdir}/usr/share/gnome-background-properties"
    mkdir -p "${pkgdir}/usr/share/backgrounds/WhiteSur"
    mkdir -p "${pkgdir}/usr/share/backgrounds/Monterey"
    mkdir -p "${pkgdir}/usr/share/backgrounds/Ventura"
    mkdir -p "${pkgdir}/usr/share/backgrounds/Sonoma"
    cd "${pkgbase}"
    cp -rf "xml-files/gnome-background-properties/WhiteSur.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/gnome-background-properties/Monterey.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/gnome-background-properties/Ventura.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/gnome-background-properties/Sonoma.xml" "${pkgdir}/usr/share/gnome-background-properties"
    cp -rf "xml-files/timed-xml-files/WhiteSur-timed.xml" "${pkgdir}/usr/share/backgrounds/WhiteSur"
    cp -rf "xml-files/timed-xml-files/Monterey-timed.xml" "${pkgdir}/usr/share/backgrounds/Monterey"
    cp -rf "xml-files/timed-xml-files/Ventura-timed.xml" "${pkgdir}/usr/share/backgrounds/Ventura"
    cp -rf "xml-files/timed-xml-files/Sonoma-timed.xml" "${pkgdir}/usr/share/backgrounds/Sonoma"
    cp -rf 4k/Monterey* "${pkgdir}/usr/share/backgrounds/Monterey"
    cp -rf 4k/WhiteSur* "${pkgdir}/usr/share/backgrounds/WhiteSur"
    cp -rf 4k/Ventura* "${pkgdir}/usr/share/backgrounds/Ventura"
    cp -rf 4k/Sonoma* "${pkgdir}/usr/share/backgrounds/Sonoma"
}
