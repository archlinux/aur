# Maintainer: Anna Schumaker <anna@nowheycreamery.com>
pkgname=emmental
pkgver=2.7
pkgrel=1
pkgdesc='The cheesy music player'
url='https://www.git.nowheycreamery.com/anna/emmental'
arch=('any')
license=('GPL3')
depends=('python' 'python-gobject' 'python-mutagen' 'python-pyxdg' 'gtk4' 'gstreamer' 'gst-plugins-base')
optdepends=('gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
source=("https://git.nowheycreamery.com/anna/emmental/archive/emmental-$pkgver.tar.gz")
sha256sums=(305be2ebaf794eecae4b28b54a4809ef70b5674e203b4925f2d59c991860c628)

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
	sed -i "s|$pkgdir||" $pkgdir/usr/bin/emmental
	sed -i "s|$pkgdir||" $pkgdir/usr/share/applications/emmental.desktop
}
