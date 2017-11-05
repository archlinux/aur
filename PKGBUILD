# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-2-theme-git
pkgver=v2.3.1.r0.g674abd0
pkgrel=1
pkgdesc="Obsidian 2 theme for Gnome 3.22+"
arch=('any')
url="https://www.gnome-look.org/p/1173113/"
license=('GPL3')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
options=(!strip)
source=("${pkgname}::git+https://github.com/madmaxms/theme-obsidian-2.git"
	    "https://github.com/madmaxms/theme-obsidian-2/archive/green.zip"
	    "https://github.com/madmaxms/theme-obsidian-2/archive/amber.zip"
	    "https://github.com/madmaxms/theme-obsidian-2/archive/red.zip")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/${pkgname}/Obsidian-2/ ${pkgdir}/usr/share/themes/Obsidian-2/
  cp -r ${srcdir}/theme-obsidian-2-{amber,green,red}/Obsidian* ${pkgdir}/usr/share/themes/

  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;
}
