# Maintainer: Vladimir Gladkov <vovkos[at]gmail>

pkgname=ioninja
pkgver=5.10.3
pkgtag=
pkgrel=1
pkgdesc="Professional all-in-one terminal emulator, sniffer, and protocol analyzer"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://ioninja.com"
license=("custom")
depends=("qt5-base" "openssl")
options=("!strip")
source_i686=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-x86.tar.xz")
source_x86_64=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-amd64.tar.xz")
source_armv7h=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-arm32.tar.xz")
source_aarch64=("https://ioninja.com/downloads/archive/ioninja/ioninja-$pkgver/ioninja-$pkgver$pkgtag-linux-arm64.tar.xz")
sha256sums_i686=("4da35c4f92ef4391fe9bdc18034107ce21590458d7de06031679c437a2ee4efe")
sha256sums_x86_64=("e6e68ab81b019f1c775fec3b03e2fcdca4af76134191ae7b221a3d13453f9688")
sha256sums_armv7h=("989041f16260242ba3414849f3ec2877a6f029342d7f7ed0bcb2a10f2c1907e7")
sha256sums_aarch64=("6ea064a4033690fde15cc70421187eb3e4e3dea96a39e5ffe6414529cfe287e0")

package() {
	case "$CARCH" in
	"i686")    NJ_ARCH=x86;;
	"x86_64")  NJ_ARCH=amd64;;
	"armv7h")  NJ_ARCH=arm32;;
	"aarch64") NJ_ARCH=arm64;;
	esac

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
