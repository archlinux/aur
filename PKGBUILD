# Maintainer: redfish <redfish@galactica.pw>

pkgname=youtube-sync-git
pkgver=0
pkgrel=1
pkgdesc="Script for maintaining an up-to-date offline mirror of a YouTube channel."
arch=('any')
url="https://github.com/PotcFdk/youtube-sync"
license=('custom')
depends=('youtube-dl')
provides=('youtube-sync')
source=(git+https://github.com/PotcFdk/youtube-sync.git)
sha256sums=('SKIP')

_pkgdir=youtube-sync

pkgver() {
	cd $_pkgdir
	printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 $_pkgdir/youtube-sync "${pkgdir}/usr/bin/youtube-sync"
	install -Dm644 $_pkgdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
