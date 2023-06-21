# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Contributor: blackleg <blackleg@openmailbox.org>

pkgname=xplane-sdk-devel
pkgver=4.0.1
pkgrel=1
pkgdesc="X-Plane SDK"
url="https://developer.x-plane.com/sdk/"
arch=("any")
license=('custom')
depends=(glibc)
source=("https://developer.x-plane.com/wp-content/plugins/code-sample-generation/sample_templates/XPSDK${pkgver//./}.zip")
sha256sums=('c1104e83d9b54b03d0084c1db52ee6491e5290994503e8dd2d4a0af637e2bdd7')

package() {
	cd "$srcdir/SDK/CHeaders"
	
	install -d -m755 "$pkgdir"/usr/include/xplane_sdk/{Widgets,Wrappers,XPLM}
	install -d -m755 "$pkgdir"/usr/share/licenses/xplane_sdk

	install -D -m644 ./Widgets/*  "$pkgdir"/usr/include/xplane_sdk/Widgets
	install -D -m644 ./Wrappers/* "$pkgdir"/usr/include/xplane_sdk/Wrappers
	install -D -m644 ./XPLM/*     "$pkgdir"/usr/include/xplane_sdk/XPLM

	install -m644 "$srcdir"/SDK/license.txt "$pkgdir"/usr/share/licenses/xplane_sdk/
}
