#Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=makepkg-tidy-ect
pkgver=r2.fd74ea3
pkgrel=1
pkgdesc='A libmakepkg tidy script for loselessly compressing files using ect'
url='http://github.com/wilbowma/makepkg-tidy-ect'
arch=('i686' 'x86_64')
license=('MIT')
depends=('ect')
source=("git+https://github.com/wilbowma/makepkg-tidy-ect")
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
	install -m755 tidy_ect.sh "${pkgdir}"/usr/share/makepkg/tidy
}
