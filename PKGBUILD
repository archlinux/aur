# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.11
pkgrel=1
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
sha256sums=('8a2f6ccf57429203995a75db218dc22a5924786c5d05af5cdf86c01038e9795a')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4-2k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-2k"
	install -Dm755 atv4-4k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-4k"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
