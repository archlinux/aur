# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=custom-adwaita-folder-icons-git
pkgver=r26.a187dd4
pkgrel=1
pkgdesc='Custom Adwaita folder icons to help organize directories'
arch=(any)
url=https://github.com/CleoMenezes/Custom-Adwaita-Folder-Icons
license=(unknown)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("icons::git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/icons"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/icons"
	rm -r {Screenshots,README.md}

	_iconsdir="$pkgdir/usr/share/icons/CustomAdwaitaFolderIcons"

	install -d "$_iconsdir"
	cp -r . "$_iconsdir"
}
