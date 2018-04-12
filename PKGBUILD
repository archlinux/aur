# Maintainer: Matt Spaulding <matt@mattops.io>
# Contributor: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on clearlooks-phenix-gtk-theme, also in the AUR

_pkgdir="clearlooks-phenix-darkpurpy-theme-7.0.1-1daca69e3ca1c50898dda81ba70ab09a1d45dfcf"

pkgname=clearlooks-phenix-darkpurpy-gtk-theme
pkgver=7.0.1
pkgrel=2
pkgdesc="Default GTK3 theme for Devuan Linux"
arch=('any')
url="https://git.devuan.org/devuan-packages/clearlooks-phenix-darkpurpy-theme/tree/7.0.1"
license=('GPL3')
depends=('gtk-engines')
optdepends=('mist-icon-theme: a visually compatible icon theme')
makedepends=('inkscape')
source=("${pkgname}.tar.gz::https://git.devuan.org/devuan-packages/clearlooks-phenix-darkpurpy-theme/repository/archive.tar.gz?ref=7.0.1")
sha256sums=('b57b806a947c7a50f0be1ce4a7ca98544c11f26010741527da89a9e252a91f6d')

prepare() {
  cd "${_pkgdir}"
}

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
