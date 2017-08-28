# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=obsidian-icon-theme-git
pkgver=r133.9c89c0d
pkgrel=1
pkgdesc="Gnome Icon Pack based upon Faenza, optimized for dark themes. All colors"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL3')
provides=('obsidian-icon-theme')
conflicts=('obsidian-icon-theme' 'obsidian-icon-theme-git')
makedepends=('git')
options=(!strip)
source=("iconpack::git+https://github.com/madmaxms/iconpack-obsidian.git")
sha256sums=('SKIP')
pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  rm ${srcdir}/iconpack/{LICENSE,README.md,logo.jpg}
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/iconpack/Obsidian* ${pkgdir}/usr/share/icons/
}
