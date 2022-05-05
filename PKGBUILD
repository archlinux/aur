# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=xscreensaver-aerial
pkgver=1.21
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
b2sums=('d4ff7880ac25299ca582be4cb26ae0592cf0a30c15af233c7ad9ee094aabfff418bc402ed087aa78f9cdca1b35dadd5c4644878547c70191cce3c30c9e15ebb5')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 atv4-2k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-2k"
	install -Dm755 atv4-4k.sh "${pkgdir}/usr/lib/xscreensaver/atv4-4k"
	install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
