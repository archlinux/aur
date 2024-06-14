# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=kwin-effects-kinetic
pkgver=2.0
pkgrel=1
pkgdesc="KWin effects optimized for a smooth and snappy KDE Plasma experience."
arch=(any)
url='https://github.com/gurrgur/kwin-effects-kinetic'
license=(GPL)
depends=(kwin)
makedepends=(zip)
source=("kwin-effects-kinetic-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('685794b21779fcaad0b769522af1afc3baa2b8b1a6ebaffeb194a2ec0239386a898993507a2b7a87b0278693eee81a3817cdafa93b58fba7048f8851004dd59e')

package() {
	cd "kwin-effects-kinetic-$pkgver"

	cd kinetic_fadingpopups
	zip kinetic_fadingpopups.kwinscript -r contents ../LICENSE metadata.json
	kpackagetool6 -t KWin/Effect -p $pkgdir/usr/share/kwin/effects -i kinetic_fadingpopups.kwinscript
	cd ../kinetic_maximize
	zip kinetic_maximize.kwinscript -r contents ../LICENSE metadata.json
	kpackagetool6 -t KWin/Effect -p $pkgdir/usr/share/kwin/effects -i kinetic_maximize.kwinscript
	cd ../kinetic_scale
	zip kinetic_scale.kwinscript -r contents ../LICENSE metadata.json
	kpackagetool6 -t KWin/Effect -p $pkgdir/usr/share/kwin/effects -i kinetic_scale.kwinscript
	cd ../kinetic_squash
	zip kinetic_squash.kwinscript -r contents ../LICENSE metadata.json
	kpackagetool6 -t KWin/Effect -p $pkgdir/usr/share/kwin/effects -i kinetic_squash.kwinscript
}
