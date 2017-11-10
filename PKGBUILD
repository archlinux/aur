# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=2.5
pkgrel=1
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/download/id/1509594446/Matcha-Theme.tar.xz")
sha256sums=('ccdce8a8de46a31cc53e2cd5f19afc173ae2dbcfaf22cf0c765203f2ffc9e175')

prepare() {
   cd Matcha-Theme/Matcha/openbox-3
   sed -i 's/\(menu.border.width:\).*$/\1 1/' themerc
}

package() {
   cd Matcha-Theme
   find Matcha{,-Dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
  find Matcha/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

