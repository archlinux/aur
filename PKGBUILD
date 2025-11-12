# Maintainer: Alexander Schnaidt <alex.schnaidt@gmail.com>
# Contributor: blackleg <blackleg@openmailbox.org>

pkgname=xplane-sdk-devel
pkgver=4.2.0
pkgrel=1
pkgdesc="X-Plane SDK"
url="https://developer.x-plane.com/sdk/"
arch=("any")
license=(LicenseRef-xplane-sdk)
depends=(glibc)
source=("https://developer.x-plane.com/wp-content/plugins/code-sample-generation/sdk_zip_files/XPSDK${pkgver//./}.zip")
sha256sums=('42aeb0d525f2a7f8fd55541c071319f08967b6ec216edde197c75034ef6bcf5a')

package() {
	cd "$srcdir/SDK/CHeaders"
	
	install -d -m755 "$pkgdir"/usr/include/xplane_sdk/{Widgets,Wrappers,XPLM}
	install -d -m755 "$pkgdir"/usr/share/licenses/${pkgname}

	install -D -m644 ./Widgets/*  "$pkgdir"/usr/include/xplane_sdk/Widgets
	install -D -m644 ./Wrappers/* "$pkgdir"/usr/include/xplane_sdk/Wrappers
	install -D -m644 ./XPLM/*     "$pkgdir"/usr/include/xplane_sdk/XPLM

	install -m644 "$srcdir"/SDK/license.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
