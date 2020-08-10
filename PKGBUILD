# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.10
pkgrel=2
arch=('any')
url="https://github.com/graysky2/xscreensaver-aerial"
license=('MIT')
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=('xscreensaver' 'mpv' 'wget')
optdepends=(
  'aerial-2k-videos: pre-downloaded videos to save bandwidth'
  'aerial-4k-videos: pre-downloaded videos to save bandwidth'
)
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
sha256sums=('8a45892c7967ffa585cfdcce63b60ef3b891ab647eb27ca51baf1bb18beff82a')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4-2k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-2k"
	install -Dm755 atv4-4k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-4k"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
