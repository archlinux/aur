# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=elementary-icon-theme-bzr
pkgver=r1175
pkgrel=1
pkgdesc='elementary icon theme'
arch=('any')
url='https://launchpad.net/elementaryicons'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('bzr')
provides=('elementary-icon-theme')
conflicts=('elementary-icon-theme')
options=('!emptydirs')
install='elementary-icon-theme.install'
source=('elementary-icon-theme::bzr+lp:elementaryicons')
sha256sums=('SKIP')

pkgver() {
  cd elementary-icon-theme

  echo "r$(bzr revno)"
}

package() {
  rm -rf elementary-icon-theme/{.bzr*,AUTHORS,CONTRIBUTORS,COPYING,icons/elementary/icon-theme.cache}
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' elementary-icon-theme "${pkgdir}"/usr/share/icons/elementary
}

# vim: ts=2 sw=2 et:

