# Maintainer: Anna Schumaker <anna@nowheycreamery.com>
pkgname=emmental
pkgver=2.2
pkgrel=1
pkgdesc='The cheesy music player'
url='https://www.git.nowheycreamery.com/anna/emmental'
arch=('any')
license=('GPL3')
depends=('python' 'python-gobject' 'python-mutagen' 'python-pyxdg' 'gtk4' 'gstreamer' 'gst-plugins-base')
optdepends=('gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
source=("https://git.nowheycreamery.com/anna/emmental/archive/emmental-$pkgver.tar.gz")
sha256sums=(7c586e988effb34573e9e80ea4b125443238b181bba1162a70b16463c99b8150)

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
	sed -i "s|$pkgdir||" $pkgdir/usr/bin/emmental
	sed -i "s|$pkgdir||" $pkgdir/usr/share/applications/emmental.desktop
}
