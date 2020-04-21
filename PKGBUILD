# Maintainer: Vladimir Gladkov <vovkos[at]gmail>

pkgname=ioninja
pkgver=3.14.1
pkgrel=2
pkgdesc="Professional, scriptable, all-in-one terminal/sniffer"
arch=("i686" "x86_64")
url="https://ioninja.com"
license=("custom")
depends=("qt5-base" "openssl")
options=("!strip")
source_i686=("https://tibbo.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver-linux-x86.tar.xz")
source_x86_64=("https://tibbo.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver-linux-amd64.tar.xz")
sha256sums_i686=("64e4aed73ca2b87c22120b29ad8acbc189af072c608853c4c417f23a9b25363f")
sha256sums_x86_64=("0bfa2190dcde9ba554a1324d2c436a8a81dead2caae7bd21ea7bd51f8da97bf0")

package() {
	if [ "$CARCH" == "x86_64" ]; then
		NJ_ARCH=amd64
	else
		NJ_ARCH=x86
	fi

	NJ_DIR=ioninja-$pkgver-linux-$NJ_ARCH

	install -d "$pkgdir"/usr/bin
	install -d "$pkgdir"/usr/lib
	install -d "$pkgdir"/usr/etc/ioninja
	install -d "$pkgdir"/usr/share/ioninja
	install -d "$pkgdir"/usr/share/applications
	install -d "$pkgdir"/usr/share/icons

	cp    $NJ_DIR/bin/* "$pkgdir"/usr/bin/
	cp -P $NJ_DIR/lib/* "$pkgdir"/usr/lib/
	cp -r $NJ_DIR/etc/ioninja/* "$pkgdir"/usr/etc/ioninja/
	cp -r $NJ_DIR/share/ioninja/* "$pkgdir"/usr/share/ioninja/
	cp    $NJ_DIR/share/applications/* "$pkgdir"/usr/share/applications/
	cp -r $NJ_DIR/share/icons/* "$pkgdir"/usr/share/icons/
}
