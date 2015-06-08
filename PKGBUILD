# Maintainer: Maxime Gauduin <alucryd@gmail.dom>

pkgname=numix-bevel-icon-theme-git
pkgver=0.r10.5f1b191
pkgrel=1
pkgdesc='Bevel icon theme from the Numix project'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('numix-icon-theme-git')
makedepends=('git')
provides=('numix-bevel-icon-theme')
conflicts=('numix-bevel-icon-theme')
options=('!strip')
install='numix-bevel-icon-theme.install'
source=('numix-bevel-icon-theme::git+https://github.com/numixproject/numix-icon-theme-bevel.git')
sha256sums=('SKIP')

pkgver() {
  cd numix-bevel-icon-theme

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd numix-bevel-icon-theme

  install -dm 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve=ownership Numix-Bevel "$pkgdir"/usr/share/icons/
}

# vim: ts=2 sw=2 et:
