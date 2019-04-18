# Maintainer: Sagacious Zu <sredshaw@gmail.com>

pkgname=victory-gtk-theme-git
pkgrel=1
pkgver=ba88eb9
pkgdesc='A flat, minimalistic, and bright gtk theme.'
arch=(any)
url="https://github.com/newhoa/victory-gtk-theme"
license=('GPL3')
#depends=('')
makedepends=('git')
#optdepends=('xfdesktop: The XFCE desktop'
#           'openbox: Openbox')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/newhoa/victory-gtk-theme.git")
md5sums=(SKIP)
#install="${pkgname}.install"

package() {
    cd ${srcdir}/victory-gtk-theme/
    rm -rf "$pkgname/{.git*,AUTHORS,CONTRIBUTORS,COPYING,README.md}"
    find Victory-17.04{,-dark,-medium,-midnight,-silver}/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;

    # Breakout the individual themes
    cp -r "${srcdir}/victory-gtk-theme/Victory-17.04-dark/" "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/victory-gtk-theme/Victory-17.04-medium/" "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/victory-gtk-theme/Victory-17.04-midnight/" "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/victory-gtk-theme/Victory-17.04-silver/" "${pkgdir}/usr/share/themes"
}