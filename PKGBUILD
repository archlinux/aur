# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=commons-category-downloader-git
pkgdesc="Quick and dirty shell script to fetch all images from a category on Wikimedia Commons"
pkgver=r12.7266f82
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/aucuparia/commons-category-downloader"
license=(GPL)
groups=()
depends=('jq')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/aucuparia/commons-category-downloader)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "commons-category-downloader"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "commons-category-downloader"
  mkdir -p "$pkgdir"/usr/bin
  mv commons_category_downloader.sh "$pkgdir"/usr/bin
}
