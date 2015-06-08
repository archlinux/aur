# Maintainer: FadeMind <fademind@gmail.com>

_basename=plasma-applet-lockkeys-qml
pkgname=kde${_basename}
pkgver=0.5
pkgrel=2
pkgdesc="This plasmoid displays the current state of the 'Num Lock' and 'Caps Lock' (a.k.a. 'Shift Lock') keys."
arch=('any')
url="http://opendesktop.org/content/show.php?content=152082"
license=('GPL')
depends=('kdebase-workspace')
source=("${_basename}-${pkgver}.plasmoid::http://kde-apps.org/CONTENT/content-files/152082-${_basename}-${pkgver}.plasmoid")
sha256sums=('e62193962109387ee60c4329bfd22fb35ba5948bc63b468267113ad5c4a03cae')

package() {
    cd ${srcdir}
    find * -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/apps/plasma/plasmoids/lockkeysstate-qml/{}" \;
    install -Dm644 ${pkgdir}/usr/share/apps/plasma/plasmoids/lockkeysstate-qml/LICENSE.GPL3 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${pkgdir}/usr/share/apps/plasma/plasmoids/lockkeysstate-qml/metadata.desktop ${pkgdir}/usr/share/kde4/services/plasma-applet-lockkeysstate-qml.desktop
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr -type f -name '.directory' -delete
}  
