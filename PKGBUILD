# Maintainer: Vladimir Gladkov <vovkos[at]gmail>

pkgname=ioninja
pkgver=5.7.3
pkgtag=
pkgrel=1
pkgdesc="Professional all-in-one terminal emulator, sniffer, and protocol analyzer"
arch=("i686" "x86_64")
url="https://ioninja.com"
license=("custom")
depends=("qt5-base" "openssl")
options=("!strip")
source_i686=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-x86.tar.xz")
source_x86_64=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-amd64.tar.xz")
sha256sums_i686=("a1e86a2a121fb281b563355168c61e12b6b4880081b283a5aa686c6a23ac83ad")
sha256sums_x86_64=("1e15845944325f23d49f0faf43a6f118f569bc7100d19fb2f929b281a90fb079")

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
