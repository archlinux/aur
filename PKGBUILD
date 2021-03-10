# Maintainer: Winux <winuxlinux11@gmail.com>

pkgname=nature-wallpapers-git
pkgver=r5.2c476ed
pkgrel=1
pkgdesc="Collection of nature wallpapers"
arch=(any)
url="https://gitlab.com/winux1/nature-wallpapers.git/"
license=('unknown')
makedepends=('git')
source=("git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "${pkgdir}/usr/share/backgrounds/nature-wallpapers"
        install -m644 *.jpg "${pkgdir}/usr/share/backgrounds/nature-wallpapers/"
}