# Maintainer: hyknn <hyknn@protonmail.com>

pkgname=spotx-bash-git
pkgver=r73.f4ae675
pkgrel=1
pkgdesc="SpotX Mac and Linux adblocker for the Spotify desktop client, in Bash"
arch=("x86_64")
url="https://github.com/SpotX-Official/SpotX-Bash"
license=('MIT')
makedepends=('git')
replaces=('spotx-git')
source=("${pkgname}::git+https://github.com/SpotX-Official/SpotX-Bash")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 ./spotx.sh "${pkgdir}/usr/bin/spotx"
}
