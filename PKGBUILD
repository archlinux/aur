# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Contributor: blackleg <blackleg@openmailbox.org>

pkgname=xplane-sdk-devel
pkgver=3.0.0
pkgrel=1
pkgdesc="X-Plane SDK"
url='http://www.xsquawkbox.net/xpsdk/mediawiki/Main_Page'
arch=("any")
license=('custom')
depends=(glibc)
source=("https://developer.x-plane.com/wp-content/plugins/code-sample-generation/sample_templates/XPSDK300.zip")
sha256sums=('c915efca8ea48be0f85a88fb4834acab81d9213ac04bb826bae8d9d744224e3f')

package() {
	cd "$srcdir/SDK/CHeaders"
	
	install -d -m755 "$pkgdir"/usr/include/xplane_sdk/{Widgets,Wrappers,XPLM}
	install -d -m755 "$pkgdir"/usr/share/licenses/xplane_sdk

	install -D -m644 ./Widgets/*  "$pkgdir"/usr/include/xplane_sdk/Widgets
	install -D -m644 ./Wrappers/* "$pkgdir"/usr/include/xplane_sdk/Wrappers
	install -D -m644 ./XPLM/*     "$pkgdir"/usr/include/xplane_sdk/XPLM

	install -m644 "$srcdir"/SDK/license.txt "$pkgdir"/usr/share/licenses/xplane_sdk/
}
