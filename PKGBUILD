# Maintainer: Vladimir Gladkov <vovkos[at]gmail>

pkgname=ioninja
pkgver=5.8.1
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
sha256sums_i686=("b4ecadd7b2bc68fa3c320f8b1808edf22d852b46f114b934ae9c21eb1e907f00")
sha256sums_x86_64=("70ddfbeb805344c5652734debe687a0ec84158502e736e00294bf7c0fe4544e2")

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
