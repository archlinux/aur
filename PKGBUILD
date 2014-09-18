_pkgname=sddm-archlinux-theme
pkgname=$_pkgname-git
pkgver=r11.8898d77
pkgrel=2
pkgdesc="Archlinux Theme for SDDM"
license=('GPL')
arch=('i686' 'x86_64')
url="https://github.com/absturztaube/sddm-archlinux-theme"
makedepends=('git')
depends=('sddm>=0.9.0')
source=("${pkgname}"::"git+https://github.com/absturztaube/sddm-archlinux-theme.git")
md5sums=('SKIP')
install="${_pkgname}.install"

build() {
    cd ${srcdir}/${pkgname}/archlinux
    # Nothing to do
}

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/${pkgname}/archlinux

    install -m 644 -D Main.qml ${pkgdir}/usr/share/sddm/themes/archlinux/Main.qml
    install -m 644 -D angle-down.png ${pkgdir}/usr/share/sddm/themes/archlinux/angle-down.png
    install -m 644 -D archlinux.qmlproject ${pkgdir}/usr/share/sddm/themes/archlinux/archlinux.qmlproject
    install -m 644 -D archlinux.qmlproject.user ${pkgdir}/usr/share/sddm/themes/archlinux/archlinux.qmlproject.user
    install -m 644 -D background.jpg ${pkgdir}/usr/share/sddm/themes/archlinux/background.jpg

    install -m 644 -D theme.conf ${pkgdir}/usr/share/sddm/themes/archlinux/theme.conf
    install -m 644 -D screenshot.png ${pkgdir}/usr/share/sddm/themes/archlinux/screenshot.png
    install -m 644 -D metadata.desktop ${pkgdir}/usr/share/sddm/themes/archlinux/metadata.desktop
}
