# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-2-theme-git
pkgver=2.25.r307.ga6ec054
pkgrel=2
pkgdesc="Obsidian 2 themes for Gnome 3.22+, all colors"
arch=(any)
url="https://github.com/madmaxms/theme-obsidian-2"
license=(GPL-3.0-or-later)
makedepends=(git)
optdepends=('gnome-tweaks: A tool to customize advanced GNOME 3 options.')
options=(!strip)
source=("obsidian-2-theme::git+https://github.com/madmaxms/theme-obsidian-2.git")
sha256sums=('SKIP')

pkgver() {
  cd "obsidian-2-theme"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d "${pkgdir}/usr/share/themes"

  cd obsidian-2-theme
  cp -r Obsidian-2* ${pkgdir}/usr/share/themes/

  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
