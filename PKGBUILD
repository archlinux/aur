# Maintainer:XXXXXXXXXXXXXXXXXXXXXXXXXXX
pkgname=mate-fastcomposwitch
pkgver=20200406
pkgrel=1
pkgdesc="Compositor or not with a simple systray icon"
arch=(x86_64)
license=('GPL')
depends=('python-gobject' 'caja' 'libappindicator-gtk3')
source=(git://github.com/Elrondo46/mate-fastcomposwitch.git)
md5sums=('SKIP')

pkgver() {
    # Identify latest version.
    cd "$srcdir/mate-fastcomposwitch"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
        install -Dm644 "mate-fastcomposwitch/marcosystray.desktop" "${pkgdir}/usr/share/applications/marcosystray.desktop"
        install -Dm755 "mate-fastcomposwitch/marcosystray" "${pkgdir}/usr/bin/marcosystray"
        install -Dm644 "mate-fastcomposwitch/icons/mate-fast-composwitch-active.png" "${pkgdir}/usr/share/icons/mate-fast-composwitch-active.png"
        install -Dm644 "mate-fastcomposwitch/icons/mate-fast-composwitch-inactive.png" "${pkgdir}/usr/share/icons/mate-fast-composwitch-inactive.png"
}
