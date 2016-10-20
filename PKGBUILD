# Maintainer: Adrian Freund <freundadrian@gmail.dom>

pkgname=numix-bevel-icon-theme-bzr
pkgver=r8
pkgrel=1
pkgdesc='Bevel icon theme from the Numix project'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('numix-icon-theme-git')
makedepends=('bzr')
provides=('numix-bevel-icon-theme')
conflicts=('numix-bevel-icon-theme')
options=('!strip')
source=('numix-bevel-icon-theme::bzr+lp:numix-bevel')
sha256sums=('SKIP')

pkgver() {
  cd numix-bevel-icon-theme

  printf "r%s" "$(bzr revno)"
}

package() {
  cd numix-bevel-icon-theme

  install -dm 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve=ownership Numix-Bevel "$pkgdir"/usr/share/icons/
}

# vim: ts=2 sw=2 et:
