# Maintainer: grimi <grimi at poczta dot fm>

_datever="2017-09-24"
pkgname=emerald-icon-theme
pkgver=${_datever//-/}
pkgrel=1
pkgdesc="Fresh and simple personality icon theme"
arch=('any')
url='https://www.gnome-look.org/p/1012534'
license=('GPL3')
depends=('hicolor-icon-theme')
source=("https://github.com/vinceliuice/${pkgname}/archive/${pkgname}-${_datever}.tar.gz")
sha256sums=('ce01089daaa0cb095c014c5d6b4aa47874056e0d451716d2f4fcc3897479419c')


prepare() {
   cd "${pkgname}-${pkgname}-${_datever}"
   sed -i 's/\(Inherits=\).*$/\1breeze,Arc,elementary,Adwaita,hicolor/' Emerald/index.theme
}

package() {
   cd "${pkgname}-${pkgname}-${_datever}"
   find Emerald{,-Dark,-Matcha}/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Emerald{,-Dark,-Matcha}/ -type l -exec cp -d  "{}" "${pkgdir}/usr/share/icons/{}" \;
}

