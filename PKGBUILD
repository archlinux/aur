# Maintainer: Alexander Schnaidt <alexander.schnaidt@mailbox.org>
# Contributor: blackleg <blackleg@openmailbox.org>

pkgname=xplane-sdk-devel
pkgver=4.3.0
pkgrel=1
pkgdesc="X-Plane SDK"
url="https://developer.x-plane.com/sdk/"
arch=("any")
license=(LicenseRef-xplane-sdk)
depends=(glibc)
source=("https://developer.x-plane.com/wp-content/plugins/code-sample-generation/sdk_zip_files/XPSDK${pkgver//./}.zip")
sha256sums=('b9875ab27b593927b4f9b3e0ddfffe7401ee5dce6d86b50aea0da65f70ff7816')

package() {
	cd "$srcdir/SDK/CHeaders"
	
	install -d -m755 "$pkgdir"/usr/include/xplane_sdk/{Widgets,Wrappers,XPLM}
	install -d -m755 "$pkgdir"/usr/share/licenses/${pkgname}

	install -D -m644 ./Widgets/*  "$pkgdir"/usr/include/xplane_sdk/Widgets
	install -D -m644 ./Wrappers/* "$pkgdir"/usr/include/xplane_sdk/Wrappers
	install -D -m644 ./XPLM/*     "$pkgdir"/usr/include/xplane_sdk/XPLM

	install -m644 "$srcdir"/SDK/license.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
