# Maintainer: john smith <hidden at mail dot com>
pkgname="grive-indicator"
pkgver=1.16
pkgrel=4
pkgdesc="Ported and improved Grive Setup to Python3 by John Smith."
arch=('any')
url="http://www.thefanclub.co.za/how-to/ubuntu-google-drive-client-grive-and-grive-tools"
license=('GPL3')
conflicts=("grive-tools" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python-pyinotify' 'python-gobject' 'dconf' 'xdg-utils' 'libnotify')
makedepends=('imagemagick')
optdepends=('gnome-shell-extension-appindicator-git: gnome indicator support'
            'gnome-shell-extension-topicons-plus: gnome indicator support')
source=("apps.grive-indicator.gschema.xml"
        "grive-indicator"
        "grive-indicator.desktop"
        "grive-indicator-autostart.desktop"
        "grive-setup"
        "copyright::https://www.gnu.org/licenses/gpl.txt"
        "grive-app-ind-active.png::http://icons.iconarchive.com/icons/marcus-roberto/google-play/48/Google-Drive-icon.png"
        "grive-app-ind-error.png::http://icons.iconarchive.com/icons/papirus-team/papirus-status/48/dialog-error-icon.png"
        "grive-indicator.png::http://icons.iconarchive.com/icons/marcus-roberto/google-play/128/Google-Drive-icon.png")
sha256sums=('3c2806ae7f03d1cb058550d9ed3ba444c2b055de2f81442e0f4fdbb295a14a03'
            '1dd615575531614eb8fb678f301b403767184924f0ec0065daae631de1e2e204'
            'bc9d6355e81d9dec91e5679d320fddd62690db351815a5b76b30d585d386c2f3'
            'cab2794a6fecb8889e0a5cad07c44a93f6e71f8ac416c047d2e1b9fca5f3deac'
            'fcf0ee45bf9e740490d863120bb7b08ff55c9750bdd714421383cf5451df0aea'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
 cd "${srcdir}"/
 convert grive-app-ind-active.png -colorspace Gray grive-app-ind-sleep.png
}

package() {
 cd "${srcdir}"/
 install -dm755 "${pkgdir}"/usr/share/applications
 install -dm755 "${pkgdir}"/usr/share/glib-2.0/schemas
 install -dm755 "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-indicator.desktop "${pkgdir}"/usr/share/applications
 install -m644 grive-app-ind-active.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-app-ind-error.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-app-ind-sleep.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-indicator.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 apps.grive-indicator.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas
 install -m644 grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-indicator "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-setup "${pkgdir}"/usr/share/${pkgname}
 install -m644 copyright "${pkgdir}"/usr/share/${pkgname}
}
