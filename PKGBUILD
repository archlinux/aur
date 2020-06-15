# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Contributor: blackleg <blackleg@openmailbox.org>

pkgname=xplane-sdk-devel
pkgver=3.0.3
pkgrel=1
pkgdesc="X-Plane SDK"
url="https://developer.x-plane.com/sdk/"
arch=("any")
license=('custom')
depends=(glibc)
source=("https://developer.x-plane.com/wp-content/plugins/code-sample-generation/sample_templates/XPSDK303.zip")
sha256sums=('11a550dc553876d8c0b7187ae2e1c7e9fee5909dce6d8469720cad51e5bcb7ff')

package() {
	cd "$srcdir/SDK/CHeaders"
	
	install -d -m755 "$pkgdir"/usr/include/xplane_sdk/{Widgets,Wrappers,XPLM}
	install -d -m755 "$pkgdir"/usr/share/licenses/xplane_sdk

	install -D -m644 ./Widgets/*  "$pkgdir"/usr/include/xplane_sdk/Widgets
	install -D -m644 ./Wrappers/* "$pkgdir"/usr/include/xplane_sdk/Wrappers
	install -D -m644 ./XPLM/*     "$pkgdir"/usr/include/xplane_sdk/XPLM

	install -m644 "$srcdir"/SDK/license.txt "$pkgdir"/usr/share/licenses/xplane_sdk/
}
