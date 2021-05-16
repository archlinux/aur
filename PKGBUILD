# Maintainer: archlinux at vale dot re

pkgname=xcursor-neutral++-white
pkgver=1.1.1
pkgrel=3
pkgdesc='Cursor theme based on neutral and jaguarx themes (white version)'
arch=(any)
url="https://www.gnome-look.org/p/999806"
license=(Artistic2.0)
source=("xcursor-neutral++-white-1.1.1.tar.xz")
sha512sums=('0027dd2823c605c810904d86fd25d021cde14c24c4b1cb507dd5829ac0cd6763fa96296db76422a1b2667b7e2a4b4ca397bfc26823f5b2656753a507cb71f0a2')

package() {
  cd "${srcdir}"

  # install the theme
  install -d "${pkgdir}"/usr/share/icons/Neutral++White
  cp -R "${srcdir}"/Neutral++_White/cursors "${pkgdir}"/usr/share/icons/Neutral++White

  # install the license
  install -D "${srcdir}"/Neutral++_White/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # set permissions and ownership
  find "${pkgdir}"/ -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/ -type f -exec chmod 644 '{}' \;
  chown -R root:root "${pkgdir}"/*
}
