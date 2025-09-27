# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=xfwm4-theme-pop-git
pkgver=r9.cb3d3b5  # This will be dynamically set
pkgrel=1
pkgdesc="Simple Xfwm theme for Xfce matching Pop GTK theme from Pop!_OS by System76 (git version)"
arch=('any')
url="https://www.opendesktop.org/p/1299758/"
license=('GPL3')
makedepends=('git')
source=("git+https://gitlab.com/spass/pop-xfwm-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd pop-xfwm-theme
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd pop-xfwm-theme
  install -d "${pkgdir}"/usr/share/themes
  cp -r --no-preserve=ownership ./* "${pkgdir}"/usr/share/themes/
  rm "${pkgdir}"/usr/share/themes/README.md 
  rm "${pkgdir}"/usr/share/themes/*.png
  rm "${pkgdir}"/usr/share/themes/*.txt
  rm "${pkgdir}"/usr/share/themes/LICENSE
}
