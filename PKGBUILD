# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=kwin-effects-kinetic
pkgver=2.0
pkgrel=1
pkgdesc="KWin effects optimized for a smooth and snappy KDE Plasma experience."
arch=(any)
url='https://github.com/gurrgur/kwin-effects-kinetic'
license=(GPL)
depends=(kwin)
source=("kwin-effects-kinetic-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('685794b21779fcaad0b769522af1afc3baa2b8b1a6ebaffeb194a2ec0239386a898993507a2b7a87b0278693eee81a3817cdafa93b58fba7048f8851004dd59e')

package() {
	cd "kwin-effects-kinetic-$pkgver"
	install -d "$pkgdir/usr/share/kwin/effects/kinetic_fadingpopups"
	install -d "$pkgdir/usr/share/kwin/effects/kinetic_maximize"
	install -d "$pkgdir/usr/share/kwin/effects/kinetic_scale"
	install -d "$pkgdir/usr/share/kwin/effects/kinetic_squash"
	cp -r LICENSE kinetic_fadingpopups/contents/ kinetic_fadingpopups/metadata.json kinetic_fadingpopups/metadata.desktop "$pkgdir/usr/share/kwin/effects/kinetic_fadingpopups/"
	cp -r LICENSE kinetic_maximize/contents/ kinetic_maximize/metadata.json kinetic_maximize/metadata.desktop "$pkgdir/usr/share/kwin/effects/kinetic_maximize/"
	cp -r LICENSE kinetic_scale/contents/ kinetic_scale/metadata.json kinetic_scale/metadata.desktop "$pkgdir/usr/share/kwin/effects/kinetic_scale/"
	cp -r LICENSE kinetic_squash/contents/ kinetic_squash/metadata.json kinetic_squash/metadata.desktop "$pkgdir/usr/share/kwin/effects/kinetic_squash/"
	install -Dm644 kinetic_fadingpopups/metadata.desktop "$pkgdir/usr/share/kservices5/kinetic_fadingpopups.desktop"
	install -Dm644 kinetic_maximize/metadata.desktop "$pkgdir/usr/share/kservices5/kinetic_maximize.desktop"
	install -Dm644 kinetic_scale/metadata.desktop "$pkgdir/usr/share/kservices5/kinetic_scale.desktop"
	install -Dm644 kinetic_squash/metadata.desktop "$pkgdir/usr/share/kservices5/kinetic_squash.desktop"
}
