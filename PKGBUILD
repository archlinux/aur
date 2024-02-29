# Maintainer: Vladimir Gladkov <vovkos[at]gmail>

pkgname=ioninja
pkgver=5.5.1
pkgtag=
pkgrel=1
pkgdesc="Professional all-in-one terminal emulator, sniffer, and protocol analyzer"
arch=("i686" "x86_64")
url="https://ioninja.com"
license=("custom")
depends=("qt5-base" "openssl")
options=("!strip")
source_i686=("https://tibbo.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-x86.tar.xz")
source_x86_64=("https://tibbo.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-amd64.tar.xz")
sha256sums_i686=("6136d57cb46052021c04ed9fb50dac593298a37ad4d36ee50d41b851796150a6")
sha256sums_x86_64=("9542250bf8e17f7173d97b496dc17289bdabb798cf9af67a20d5a69ef3956386")

package() {
	if [ "$CARCH" == "x86_64" ]; then
		NJ_ARCH=amd64
	else
		NJ_ARCH=x86
	fi

	NJ_DIR=ioninja-$pkgver$pkgtag-linux-$NJ_ARCH

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
