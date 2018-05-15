# Maintainer: Hokuto <abrahamhokuto@outlook.com>

pkgname=gtk-theme-windows-longhorn-git
pkgver=r95.8afdf4f
pkgrel=1
pkgdesc="Longhorn beta themes"
arch=('any')
url="https://github.com/Elbullazul/Longhorn-Collaboration"
license=('GPL')
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=('git+https://github.com/Elbullazul/Longhorn-Collaboration.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/Longhorn-Collaboration"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/Longhorn-Collaboration"

  rm -rf .git
  rm Readme.md
  rm 'Tips for themes.md'

  mkdir -p "$pkgdir/usr/share/themes"
  
  cp -r * "$pkgdir/usr/share/themes/"

  find "$pkgdir/usr/share/themes/" -type d -exec \
       chmod 755 {} \;

  find "$pkgdir/usr/share/themes/" -type f -exec \
       chmod 644 {} \;
}
