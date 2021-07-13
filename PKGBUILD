# Maintainer: Matt Spaulding <matt@mattops.io>
# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on clearlooks-phenix-gtk-theme, also in the AUR

_pkgdir="clearlooks-phenix-darkpurpy-theme"

pkgname=clearlooks-phenix-darkpurpy-gtk-theme
pkgver=7.0.2
pkgrel=1
pkgdesc="Default GTK3 theme for Devuan Linux"
arch=('any')
url="https://git.devuan.org/devuan/clearlooks-phenix-darkpurpy-theme"
license=('GPL3')
depends=('gtk-engines')
optdepends=('mist-icon-theme: a visually compatible icon theme')
makedepends=('inkscape')
source=("${pkgname}.tar.gz::https://git.devuan.org/devuan/clearlooks-phenix-darkpurpy-theme/archive/${pkgver}.tar.gz")
sha256sums=('c53f961fa6d2e5ed7201d7da5365a45b34959514d80285af494aef5b149f4e18')

build() {
  cd "${_pkgdir}"

  # Prefer building icons from SVG source
  # make -C _src clean all
}

package() {
  cd "${_pkgdir}"

  mkdir -p "${pkgdir}/usr/share/themes/Clearlooks-Phenix-DarkPurpy"
  cp -a gtk-2.0 gtk-3.0 index.theme metacity-1 openbox-3 xfwm4 \
     "${pkgdir}/usr/share/themes/Clearlooks-Phenix-DarkPurpy"

  install -D -m 0644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/* *.md
}

# vim:set ts=2 sw=2 et:
