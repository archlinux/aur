# Maintainer: Vladimir Gladkov <vovkos[at]gmail>

pkgname=ioninja
pkgver=5.10.2
pkgtag=
pkgrel=2
pkgdesc="Professional all-in-one terminal emulator, sniffer, and protocol analyzer"
arch=("i686" "x86_64")
url="https://ioninja.com"
license=("custom")
depends=("qt5-base" "openssl")
options=("!strip")
source_i686=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-x86.tar.xz")
source_x86_64=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-amd64.tar.xz")
sha256sums_i686=("fa09bae883e1742c5cbb02264adb66393885cdc06f6897a82ddb87d3e46ea715")
sha256sums_x86_64=("170b624b9c4bf106c0fa3de4202c1c7038be8087d5d732b570fd98280baf578a")

package() {
	if [ "$CARCH" == "x86_64" ]; then
		NJ_ARCH=amd64
	else
		NJ_ARCH=x86
	fi

	NJ_DIR=ioninja-$pkgver$pkgtag-linux-$NJ_ARCH

	install -d "$pkgdir"/usr/bin
	install -d "$pkgdir"/usr/lib/ioninja
	install -d "$pkgdir"/usr/etc/ioninja
	install -d "$pkgdir"/usr/share/ioninja
	install -d "$pkgdir"/usr/share/applications
	install -d "$pkgdir"/usr/share/icons

	cp    $NJ_DIR/bin/* "$pkgdir"/usr/bin/
	cp -P $NJ_DIR/lib/ioninja/* "$pkgdir"/usr/lib/ioninja/
	cp -r $NJ_DIR/etc/ioninja/* "$pkgdir"/usr/etc/ioninja/
	cp -r $NJ_DIR/share/ioninja/* "$pkgdir"/usr/share/ioninja/
	cp    $NJ_DIR/share/applications/* "$pkgdir"/usr/share/applications/
	cp -r $NJ_DIR/share/icons/* "$pkgdir"/usr/share/icons/
}
