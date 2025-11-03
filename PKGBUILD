# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds
# Contributor: scan

pkgname=obsidian-2-theme
pkgver=2.25
pkgrel=1
pkgdesc="Obsidian 2 Theme - Gnome theme, based upon Adwaita-Maia dark skin"
arch=('any')
url="https://github.com/madmaxms/theme-obsidian-2/"
license=('GPL-3.0-or-later')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=(
	"${pkgname}-${pkgver}.tar.xz::https://github.com/madmaxms/theme-obsidian-2/releases/download/v${pkgver}/obsidian-2-theme.tar.xz"
)
b2sums=('ac7458bb7da9debc7b53c109dd0d694b54b40f83c9f0baaa6a4493920813817183eceb62cd2977794a6d2b820247a6920bea542090c0ae1c5b8079bdd355dac7')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r ${srcdir}/Obsidian-2* ${pkgdir}/usr/share/themes/
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
