# Maintainer: john smith <hidden at mail dot com>
pkgname="grive-indicator"
pkgver=1.17
pkgrel=2
pkgdesc="Ported and improved Grive Tools (Indicator) to Python3 by John Smith."
arch=('any')
url="https://github.com/john4smith/grive-indicator"
license=('GPL3')
conflicts=("grive-tools" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python-pyinotify' 'python-gobject' 'dconf' 'xdg-utils' 'libnotify')
optdepends=('gnome-shell-extension-appindicator-git: gnome indicator support'
            'gnome-shell-extension-topicons-plus: gnome indicator support')
source=("grive-indicator-${pkgver}.tar.gz::https://github.com/john4smith/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c1c941ee493a593a8176f38477700a021321004ef44766e6962b38f899b3f021')

package() {
 cd "${srcdir}"/grive-indicator-${pkgver}/
 install -dm755 "${pkgdir}"/usr/share/applications
 install -dm755 "${pkgdir}"/usr/share/glib-2.0/schemas
 install -dm755 "${pkgdir}"/usr/share/${pkgname}/icons/loader
 install -m644 grive-indicator.desktop "${pkgdir}"/usr/share/applications
 install -m644 icons/*.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 icons/loader/*.png "${pkgdir}"/usr/share/${pkgname}/icons/loader
 install -m644 apps.grive-indicator.gschema.xml "${pkgdir}"/usr/share/glib-2.0/schemas
 install -m644 grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-indicator "${pkgdir}"/usr/share/${pkgname}
 install -m755 grive-setup "${pkgdir}"/usr/share/${pkgname}
 install -m644 LICENSE "${pkgdir}"/usr/share/${pkgname}
}
