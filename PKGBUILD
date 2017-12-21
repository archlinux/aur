# Maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=2.9
pkgrel=2
pkgdesc="A flat design theme for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://www.gnome-look.org/p/1187179'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1513734260/s/b14a4af4a136bcbf7eff44b1a91a345f/t/1513839589/Matcha-Theme.tar.xz")
sha256sums=('d670c0e4127b225abbf0d1da4d2a4a6cde40c241b39901fe5484403bcc3a6557')

prepare() {
   cd Matcha-Theme/Matcha
   sed -i 's/\(menu.border.width:\).*$/\1 1/' openbox-3/themerc
}

package() {
   cd Matcha-Theme
   find Matcha{,-Dark}/ -type f ! -name thumbnail.png -exec install -Dm644 "{}" "${pkgdir}/usr/share/themes/{}" \;
   find Matcha/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/themes/{}" \;
}

