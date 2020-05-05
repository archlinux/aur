# Maintainer: Nathan Owens <ndowens @ artixlinux.org>
pkgname=papirus-claws-mail-theme-git 
pkgver=20200504
pkgrel=1
pkgdesc="Papirus theme for claws mail"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-claws-mail-theme"
license=('GPL3')
makedepends=('git' 'librsvg')
_commit=7d02981d23ecfc279c87ff6c172ba09314940352
source=("git+${url}#commit=${_commit}")
md5sums=('SKIP')

build() {
	cd "${pkgname/-git/}"
	make build
}

package() {
	cd "${pkgname/-git/}"
	make DESTDIR="$pkgdir/" install
}
