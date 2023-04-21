# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# Contributor: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=numix-square-icon-theme-git
pkgver=23.04.20.r0.a1a1a02f
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
  git describe --tags --long | sed 's/-/.r/; s/-g/./'
}

package() {
  cd numix-square-icon-theme

  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Numix-Square{,-Light} "${pkgdir}"/usr/share/icons/
}
