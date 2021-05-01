# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=xscreensaver-aerial
pkgver=1.20
pkgrel=1
arch=(any)
url="https://github.com/graysky2/xscreensaver-aerial"
license=(MIT)
pkgdesc='xscreensaver hack that randomly selects one of the Apple TV4 HD aerial movies'
depends=(xscreensaver mplayer wget)
optdepends=(
  'aerial-2k-videos: pre-downloaded videos to save bandwidth'
  'aerial-4k-videos: pre-downloaded videos to save bandwidth'
)
install=readme.install
source=("https://github.com/graysky2/xscreensaver-aerial/archive/v$pkgver.tar.gz")
b2sums=('4f25e7f66fdd272a67ef292dc1cc249a2e64f3c08580d67f0d3aed9530661ad7891587f4f9347ea31a75e5fe39191e15c20d6a5008a625d4eb59df7c404149dd')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4-2k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-2k"
	install -Dm755 atv4-4k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-4k"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
