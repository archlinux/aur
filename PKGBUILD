# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
pkgname=vlc-listenbrainz-git
_pkgname="${pkgname%-git}"
pkgver=r11.1a8886e
pkgrel=1
pkgdesc='ListenBrainz plugin for VLC'
arch=('i686' 'x86_64')
url='https://github.com/amCap1712/vlc-listenbrainz-plugin'
license=('GPL')
depends=('vlc')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/vlc-listenbrainz-plugin"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/vlc-listenbrainz-plugin"
	make
}

package() {
	cd "${srcdir}/vlc-listenbrainz-plugin"
	make DESTDIR="$pkgdir/" install
}
