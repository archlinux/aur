# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Gobidev <adrian[dot]groh[at]t-online[dot]de>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=kwin-scripts-forceblur-plasma6
pkgver=0.7.0
pkgrel=1
pkgdesc="Force-enable blur effect to user-specified windows"
arch=(any)
url='https://github.com/esjeon/kwin-forceblur'
license=(MIT)
depends=(kwin)
conflicts=('kwin-scripts-forceblur')
provides=('kwin-scripts-forceblur')
source=("kwin-forceblur-$pkgver.tar.gz::https://github.com/bouteillerAlan/kwin-forceblur/archive/refs/heads/feat/upgrade-to-new-guidelines.tar.gz")
sha256sums=('4b7cd5dc094096f65947143a0b5e45657031c30244877ec438d1427707fc2e3c')

package() {
	cd "kwin-forceblur-feat-upgrade-to-new-guidelines"
	install -d "$pkgdir/usr/share/kwin/scripts/forceblur"
	cp -r contents/ LICENSE image.png metadata.json "$pkgdir/usr/share/kwin/scripts/forceblur/"
	install -Dm644 metadata.json "$pkgdir/usr/share/kservices5/kwin-script-forceblur.desktop"
}
