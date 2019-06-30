# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=obsidian-icon-theme-git
pkgver=4.4.r1.ge204941e
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
  cd "${srcdir}/iconpack"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  rm ${srcdir}/iconpack/{LICENSE,README.md,logo.jpg}
  install -d ${pkgdir}/usr/share/icons
  cp -r ${srcdir}/iconpack/Obsidian* ${pkgdir}/usr/share/icons/
}
