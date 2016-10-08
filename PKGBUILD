# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on clearlooks-phenix-gtk-theme-git, also in the AUR

pkgname=clearlooks-phenix-gtk-theme
pkgver=7.0.1
pkgrel=1
pkgdesc="GTK3 theme visually close to Clearlooks"
arch=('any')
url="https://github.com/jpfleury/clearlooks-phenix"
license=('GPL3')
depends=('gtk-engines')
optdepends=('mist-icon-theme: a visually compatible icon theme')
makedepends=('inkscape')
conflicts=('clearlooks-phenix-gtk-theme-git')
source=("https://github.com/jpfleury/clearlooks-phenix/archive/${pkgver}.tar.gz")
sha256sums=('2a9b21400f9960422e31dc4dabb4f320a16b76776a9574f0986bb00e97d357f4')

shopt -s extglob || exit 1

build() {
  cd "clearlooks-phenix-${pkgver}"

  # Prefer building icons from SVG source
  make -C _src clean all
}

package() {
  cd "clearlooks-phenix-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/themes/Clearlooks-Phenix"
  cp -a !(doc|*.md|COPYING|_src) "${pkgdir}/usr/share/themes/Clearlooks-Phenix"

  install -D -m 0644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/* *.md
}

# vim:set ts=2 sw=2 et:
