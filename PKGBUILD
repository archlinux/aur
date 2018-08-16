# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gtk-theme-elementary-git
pkgver=5.1.1.r90.24e5a70
pkgrel=1
pkgdesc='elementary GTK theme'
arch=('any')
url='https://github.com/elementary/stylesheet'
license=('GPL3')
groups=('pantheon-unstable')
optdepends=('gtk-engine-murrine: GTK2 theme')
makedepends=('git')
provides=('gtk-theme-elementary')
conflicts=('gtk-theme-elementary')
replaces=('gtk-theme-elementary-bzr')
source=('gtk-theme-elementary::git+https://github.com/elementary/stylesheet.git')
sha256sums=('SKIP')

pkgver() {
  cd gtk-theme-elementary

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

package() {
  install -dm 755 "${pkgdir}"/usr/share/themes
  cp -dr --no-preserve='ownership' gtk-theme-elementary "${pkgdir}"/usr/share/themes/elementary
  rm -rf "${pkgdir}"/usr/share/themes/elementary/{.git,.gitignore,.stylelintrc.json,.travis.yml}
}

# vim: ts=2 sw=2 et:
