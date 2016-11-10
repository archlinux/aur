# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=numix-square-icon-theme-git
pkgver=0.r3.3773866
pkgrel=1
pkgdesc='Square icon theme from the Numix project'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('numix-icon-theme-git')
makedepends=('git')
provides=('numix-square-icon-theme' 'numix-square-light-icon-theme')
conflicts=('numix-square-icon-theme' 'numix-square-light-icon-theme')
options=('!strip')
source=('numix-square-icon-theme::git+https://github.com/numixproject/numix-icon-theme-square.git')
sha256sums=('SKIP')

pkgver() {
  cd numix-square-icon-theme

  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd numix-square-icon-theme

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Numix-Square{,-Light} "${pkgdir}"/usr/share/icons/
}
