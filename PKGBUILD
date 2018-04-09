# Maintainer: john smith <hidden at mail dot com>
pkgname="grive-indicator"
pkgver=1.16
pkgrel=6
pkgdesc="Ported and improved Grive Tools (Indicator) to Python3 by John Smith."
arch=('any')
url="https://github.com/john4smith/grive-indicator"
license=('GPL3')
conflicts=("grive-tools" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python-pyinotify' 'python-gobject' 'dconf' 'xdg-utils' 'libnotify')
optdepends=('gnome-shell-extension-appindicator-git: gnome indicator support'
            'gnome-shell-extension-topicons-plus: gnome indicator support')
source=("grive-indicator-${pkgver}.tar.gz::https://github.com/john4smith/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('08a04ad92b2deb688a67611922ed2facc9476395b94c3fed080a2ae839366393')

package() {
 cd "${srcdir}"/grive-indicator-${pkgver}/
 install -dm755 "${pkgdir}"/usr/share/applications
 install -dm755 "${pkgdir}"/usr/share/glib-2.0/schemas
 install -dm755 "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 grive-indicator.desktop "${pkgdir}"/usr/share/applications
 install -m644 icons/* "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 apps.grive-indicator.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas
 install -m644 grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-indicator "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-setup "${pkgdir}"/usr/share/${pkgname}
 install -m644 LICENSE "${pkgdir}"/usr/share/${pkgname}
}
