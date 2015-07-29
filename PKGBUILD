# Maintainer: Luca Stefani <luca.stefani.ge1@gmail.com>
# Contributor: Gregor Schram <gschram@protonmail.ch>

pkgname=gregor-themes-git
pkgver=0.1.r1.8f6021d
pkgrel=1
pkgdesc='gregor160300 theme for xfce'
arch=('any')
url='https://github.com/gregor160300/Theme'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('gregor-themes')
conflicts=('gregor-themes')
source=('gregor-themes::git+https://github.com/gregor160300/Theme.git')
md5sums=('SKIP')

pkgver() {
  cd gregor-themes

  printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

package() {
  cd gregor-themes

  install -dm 755 "${pkgdir}"/usr/share/themes/Gregor
  rm -rf .git .SRCINFO README.md
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Gregor
}
