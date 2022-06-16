# Maintainer: Luc <luc@dougy147.com>
pkgname=scitopdf
pkgver=0.1.r113.91b7463
pkgrel=1
epoch=
pkgdesc="bash script to quickly fetch, download and open scientific papers from Sci-Hub's database."
arch=(x86_64 i686)
url="https://github.com/dougy147/scitopdf.git"
license=('GPL')
groups=()
depends=(zathura)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(scitopdf)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd scitopdf
	make PREFIX=/usr/local DESTDIR="${pkgdir}" install
}
