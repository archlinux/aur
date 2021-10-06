# Maintainer: Mykyta Poturai <mykyta.poturai@tutanota.com>
pkgname=vifmimg-git
pkgrel=1
pkgver=r36.afe4f15
pkgdesc="Image previews using Überzug for vifm"
arch=(x86_64)
url="https://github.com/cirala/vifmimg"
license=('GPL3')
depends=(vifm ueberzug)
optdepends=("ffmpegthumbnailer: for video previews"
	    "imagemagick: for .ico previews"
            "poppler: for pdf previews"
            "gnome-epub-thumbnailer: for epub previews"
            "djvulibre: for djvu previews"
	    "fontpreview-git: for font previews")
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=("git+${url}.git#branch=master")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 vifmimg "$pkgdir/usr/bin/vifmimg"
	install -D -m755 vifmrun "$pkgdir/usr/bin/vifmrun"
	echo "Done"

}
