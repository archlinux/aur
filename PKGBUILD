# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=obsidian-icon-theme-git
pkgver=r126.17fe027
pkgrel=1
pkgdesc="Gnome Icon Pack based upon Faenza, optimized for dark themes. All colors"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL3')
provides=('obsidian-icon-theme')
conflicts=('obsidian-icon-theme' 'obsidian-icon-theme-git')
makedepends=('git')
source=("iconpack-obsidian-blue::git+https://github.com/madmaxms/iconpack-obsidian.git"
        "https://github.com/madmaxms/iconpack-obsidian/archive/green.zip"
        "https://github.com/madmaxms/iconpack-obsidian/archive/gray.zip")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  rm ${srcdir}/iconpack-obsidian-{blue,gray,green}/{LICENSE,README.md,logo.jpg}
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/iconpack-obsidian-blue ${pkgdir}/usr/share/icons/Obsidian_blue
  cp -r ${srcdir}/iconpack-obsidian-gray ${pkgdir}/usr/share/icons/Obsidian_gray
  cp -r ${srcdir}/iconpack-obsidian-green ${pkgdir}/usr/share/icons/Obsidian_green
}


