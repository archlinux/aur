# Maintainer: Jack Random <jack ät random.to>
# previous maintainer: Michael J. Pento <mjpento@verizon.net>
# previous maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=2020_02_06
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://github.com/vinceliuice/matcha'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
source=("https://github.com/vinceliuice/matcha/archive/${pkgver//_/-}.tar.gz")

sha256sums=('7b22059984c06afe2f4bf93d11e8b5e3c999a4cbb16d655b75e2aa1ce8cad6ed')

package() {
  mkdir "${pkgdir}"/usr
  mkdir "${pkgdir}"/usr/share
  mkdir "${pkgdir}"/usr/share/themes
  cd "Matcha-gtk-theme-${pkgver//_/-}"
  export _ORIGINAL_MATCHA_INSTALL_DIR=/usr/share/themes
  export _NEW_MATCHA_INSTALL_DIR="${pkgdir}"/usr/share/themes
  sed -i 's|'${_ORIGINAL_MATCHA_INSTALL_DIR}'|'${_NEW_MATCHA_INSTALL_DIR}'|g' ./Install
      ./Install
}
