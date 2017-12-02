# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=2.7
pkgrel=1
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1512132306/Matcha-Theme.tar.xz")
sha256sums=('eb569f28676a0d39832e7e038a2de1a4a56cd7a3821c25e000cdb77cadbdfee9')


prepare() {
   cd Matcha-Theme/Matcha
   sed -i 's/\(menu.border.width:\).*$/\1 1/' openbox-3/themerc
}

package() {
   cd Matcha-Theme
   find Matcha{,-Dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

