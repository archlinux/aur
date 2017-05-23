# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-icon-theme-git
pkgver=r1980.b9521515
pkgrel=1
pkgdesc='Named, vector icons for elementary OS'
arch=('any')
url='https://github.com/elementary/icons'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('git')
provides=('elementary-icon-theme')
conflicts=('elementary-icon-theme')
options=('!emptydirs')
source=('elementary-icon-theme::git+https://github.com/elementary/icons.git')
sha256sums=('SKIP')

pkgver() {
  cd elementary-icon-theme

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  rm -rf elementary-icon-theme/{.git*,AUTHORS,CONTRIBUTORS,COPYING,README.md,icons/elementary/icon-theme.cache}
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' elementary-icon-theme "${pkgdir}"/usr/share/icons/elementary
}

# vim: ts=2 sw=2 et:

