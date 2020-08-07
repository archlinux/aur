# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='xscreensaver-aerial'
pkgver=1.10
pkgrel=1
arch=('any')
url="https://github.com/graysky2/xscreensaver-aerial"
license=('MIT')
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=('xscreensaver' 'mpv' 'wget')
optdepends=(
  'xscreensaver-aerial-videos-2k: pre-downloaded videos to save bandwidth'
  'xscreensaver-aerial-videos-4k: pre-downloaded videos to save bandwidth'
)
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
sha256sums=('b7e25cf42111c54067defb3ac576f17174af576be736860033b21b73e4143b3a')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4-2k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-2k"
	install -Dm755 atv4-4k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-4k"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
