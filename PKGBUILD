# Maintainer: john smith <hidden at mail dot com>
pkgname="grive-indicator"
pkgver=1.16
pkgrel=1
pkgdesc="Ported and improved Grive Setup to Python3 by John Smith."
arch=('any')
url="http://www.thefanclub.co.za/how-to/ubuntu-google-drive-client-grive-and-grive-tools"
license=('GPL3')
conflicts=("grive-tools" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python-pyinotify' 'python-gobject' 'dconf' 'xdg-utils' 'libnotify')
optdepends=('gnome-shell-extension-appindicator-git: gnome indicator support'
            'gnome-shell-extension-topicons-plus: gnome indicator support')
source=("apps.grive-indicator.gschema.xml"
        "grive-indicator"
        "grive-indicator.desktop"
        "grive-indicator-autostart.desktop"
        "grive-setup"
        "copyright::http://www.gnu.org/licenses/gpl.txt"
        "grive-app-ind-active.png::https://upload.wikimedia.org/wikipedia/commons/d/da/Google_Drive_logo.png"
        "grive-app-ind-error.svg::https://upload.wikimedia.org/wikipedia/commons/2/2c/Gnome-dialog-error.svg"
        "grive-app-ind-sleep.svg::https://upload.wikimedia.org/wikipedia/commons/9/9c/Googledrive_logo_weiss.svg"
        "grive-indicator.png::https://upload.wikimedia.org/wikipedia/commons/d/da/Google_Drive_logo.png")
sha256sums=('3c2806ae7f03d1cb058550d9ed3ba444c2b055de2f81442e0f4fdbb295a14a03'
            '0700f48d1632075cd2a822df5349952b60df503d43d8f8b94e900e971eee073d'
            'bc9d6355e81d9dec91e5679d320fddd62690db351815a5b76b30d585d386c2f3'
            'cab2794a6fecb8889e0a5cad07c44a93f6e71f8ac416c047d2e1b9fca5f3deac'
            'fcf0ee45bf9e740490d863120bb7b08ff55c9750bdd714421383cf5451df0aea'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '7c032e2309d4086aedd5f814ff88c99d4df502eb09951037e4ab6b64bfd3757b'
            '74ab21ad8d70dbcefe5f0005a76911dffc7e54b1b4bb81cc0649bb5a80249c90'
            '6a9809bf1ddf233dc477e9b889e13a8e93b5cc8e36906373c7b1a10606751111'
            '7c032e2309d4086aedd5f814ff88c99d4df502eb09951037e4ab6b64bfd3757b')

package() {
 cd "${srcdir}"/
 install -dm755 "${pkgdir}"/usr/share/applications
 install -dm755 "${pkgdir}"/usr/share/glib-2.0/schemas
 install -dm755 "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-indicator.desktop "${pkgdir}"/usr/share/applications
 install -m644 grive-app-ind-active.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-app-ind-error.svg "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-app-ind-sleep.svg "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-indicator.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 apps.grive-indicator.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas
 install -m644 grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-indicator "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-setup "${pkgdir}"/usr/share/${pkgname}
 install -m644 copyright "${pkgdir}"/usr/share/${pkgname}
}
