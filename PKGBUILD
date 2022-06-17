# Maintainer: Luc <luc@dougy147.com>
pkgname=scitopdf
pkgver=0.1.r113.91b7463
pkgrel=1
pkgdesc="bash script to quickly fetch, download and open scientific papers from Sci-Hub's database."
arch=(x86_64 i686)
url="https://github.com/dougy147/scitopdf.git"
license=('GPL')
depends=(zathura)
makedepends=(git)
provides=(scitopdf)
replaces=(scitopdf-git)
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd scitopdf
	make PREFIX=/usr/local DESTDIR="${pkgdir}" install
}
