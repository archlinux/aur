# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=kwin-scripts-forceblur
pkgver=0.5
pkgrel=1
pkgdesc="Force-enable blur effect to user-specified windows"
arch=(any)
url='https://github.com/esjeon/kwin-forceblur'
license=(MIT)
depends=(kwin)
source=("kwin-forceblur.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ed7c2d9c36d0a4b7e8d25a533eb0efc78e4444d1d9b8a8f2f59c8a7ce80ba238')

package() {
	cd "kwin-forceblur-$pkgver"
	install -d "$pkgdir/usr/share/kwin/scripts/forceblur"
	cp -r bin/ contents/ LICENSE image.png metadata.desktop "$pkgdir/usr/share/kwin/scripts/forceblur/"
	install -Dm644 metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-forceblur.desktop"
}
