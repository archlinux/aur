# Maintainer: Mehmet Ümit Özden <ozdenmehmetumit@gmail.com>
pkgname=colpick
pkgver=1.5.0.r1.g39feef2
pkgrel=1
pkgdesc="Pick color at the current position of the mouse"
arch=(any)
url="https://github.com/mehmetumit/colpick.git"
license=('GPL3')
makedepends=('git')
depends=('imagemagick' 'scrot' 'xdotool')
optdepends=('xclip' 'notification-daemon')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

package() {
	cd "${pkgname}"
	make PREFIX="/usr/local/" TARGET_FILE="${pkgname}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
