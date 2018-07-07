#Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=makepkg-tidy-pdfsizeopt
pkgver=r1.8171579
pkgrel=1
pkgdesc='A libmakepkg tidy script for loselessly optimizing PDFs using pdfsizeopt'
url='http://github.com/wilbowma/makepkg-tidy-ect'
arch=('i686' 'x86_64')
license=('BSD')
depends=('ect' 'pdfsizeopt' 'jbig2enc')
source=("git+https://github.com/wilbowma/makepkg-tidy-pdfsizeopt")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
true
}

package() {
	cd "${srcdir}/${pkgname}"

	install -d "${pkgdir}"/usr/share/makepkg/tidy
	install -m755 tidy_pdfsizeopt.sh "${pkgdir}"/usr/share/makepkg/tidy
}
