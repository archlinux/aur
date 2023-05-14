# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-2-theme-git
pkgver=2.21.r0.g5da6c3a
pkgrel=1
pkgdesc="Obsidian 2 themes for Gnome 3.22+, all colors"
arch=(any)
url="https://www.gnome-look.org/p/1173113/"
license=(GPL3)
makedepends=(git)
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
options=(!strip)
source=("theme-obsidian-2-blue::git+https://github.com/madmaxms/theme-obsidian-2.git"
	    "theme-obsidian-2-green::git+https://github.com/madmaxms/theme-obsidian-2#branch=green"
	    "theme-obsidian-2-amber::git+https://github.com/madmaxms/theme-obsidian-2#branch=amber"
        "theme-obsidian-2-purple::git+https://github.com/madmaxms/theme-obsidian-2#branch=purple"
	    "theme-obsidian-2-red::git+https://github.com/madmaxms/theme-obsidian-2#branch=red")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "theme-obsidian-2-blue"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d "${pkgdir}/usr/share/themes"
  cp -r ${srcdir}/theme-obsidian-2-{blue,amber,green,red,purple}/Obsidian* ${pkgdir}/usr/share/themes/

  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
