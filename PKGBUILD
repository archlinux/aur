# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: scan

pkgname=obsidian-icon-theme
pkgver=20170626
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=2c3a5f4fe3c6e3022bdbb8136b9b0452499a08ef
_git_sha_green=eaa31d64425f848e8f8b2182e506295e0baeb90e
_git_sha_gray=3c1b132b8a0c7de393a67280b7d2b733dfb2e00c
source=(
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz"
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha_green.tar.gz"
	"https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha_gray.tar.gz"
)
sha256sums=(
	'94946d5b92ddce509a6fb1f3b563581f74c199e6f4d7962efdb2b7bae70bd128'
	'a4b0542cfe81d189e2e2f3c8c1b2c201c95a5180fb416082a3019adb5c608929'
	'133d578a58c2ed9436b855efd0ee0a3e5ecf3e5b902e7cc4ccfb22962041baff'
)

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha ${pkgdir}/usr/share/icons/Obsidian
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha_gray ${pkgdir}/usr/share/icons/Obsidian_gray
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha_green ${pkgdir}/usr/share/icons/Obsidian_green
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
