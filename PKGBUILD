# Maintainer: Jack Random <jack ät random.to>
# previous maintainer: Michael J. Pento <mjpento@verizon.net>
# previous maintainer: grimi <grimi at poczta dot fm>

pkgname=matcha-gtk-theme
pkgver=2019_11_02
pkgrel=1
pkgdesc="A flat design themes for GNOME, MATE, Openbox, Unity, XFCE, Budgie"
arch=('any')
url='https://github.com/vinceliuice/matcha'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
source=("https://github.com/vinceliuice/matcha/archive/${pkgver//_/-}.tar.gz")

sha256sums=('44050eff15133d65f5f3b6561e6c44668c97a7838420bbf241c146973b35616f')

package() {
  mkdir "${pkgdir}"/usr
  mkdir "${pkgdir}"/usr/share
  mkdir "${pkgdir}"/usr/share/themes
  cd "matcha-${pkgver//_/-}"
  export _ORIGINAL_MATCHA_INSTALL_DIR=/usr/share/themes
  export _NEW_MATCHA_INSTALL_DIR="${pkgdir}"/usr/share/themes
  sed -i 's|'${_ORIGINAL_MATCHA_INSTALL_DIR}'|'${_NEW_MATCHA_INSTALL_DIR}'|g' ./Install
      ./Install
}
