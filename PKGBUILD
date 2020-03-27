# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgbase=chicago95-git
pkgname=(chicago95-gtk-theme-git
         chicago95-icon-theme-git
         xcursor-chicago95-git)
pkgver=v1.0.1.r18.g59e652d
pkgrel=1
pkgdesc="Windows 95 inspired theme"
arch=(any)
url="https://github.com/grassmunk/Chicago95"
license=('GPL')
depends=(gtk3)
makedepends=(git)
source=("git+https://github.com/grassmunk/Chicago95.git")
sha256sums=(SKIP)

pkgver() {
    cd Chicago95
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_chicago95-gtk-theme-git() {
    pkgdesc="Windows 95 inspired GTK theme"
    provides=(chicago95-gtk-theme)
    conflicts=(chicago95-gtk-theme)

    cd Chicago95
    install -d "${pkgdir}/usr/share/themes/"
    cp -r "Theme/Chicago95/" "${pkgdir}/usr/share/themes/Chicago95/"
}

package_chicago95-icon-theme-git() {
    pkgdesc="Windows 95 inspired icon theme"
    provides=(chicago95-icon-theme)
    conflicts=(chicago95-icon-theme)

    cd Chicago95
    install -d "${pkgdir}/usr/share/icons/"
    cp -r "Icons/Chicago95/" "${pkgdir}/usr/share/icons/Chicago95/"
    cp -r "Icons/Chicago95-tux/" "${pkgdir}/usr/share/icons/Chicago95-tux/"
}

package_xcursor-chicago95-git() {
    pkgdesc="Windows 95 inspired cursors"
    provides=(xcursor-chicago95)
    conflicts=(xcursor-chicago95)

    cd Chicago95
    install -d "${pkgdir}/usr/share/icons/Chicago95_Cursor_Black/"
    cp -r "Cursors/Chicago95_Cursor_Black/cursors/" "${pkgdir}/usr/share/icons/Chicago95_Cursor_Black/cursors/"
    install -d "${pkgdir}/usr/share/icons/Chicago95_Cursor_White/"
    cp -r "Cursors/Chicago95_Cursor_White/cursors/" "${pkgdir}/usr/share/icons/Chicago95_Cursor_White/cursors/"
    install -d "${pkgdir}/usr/share/icons/Chicago95_Emerald/"
    cp -r "Cursors/Chicago95_Emerald/cursors/" "${pkgdir}/usr/share/icons/Chicago95_Emerald/cursors/"
}
