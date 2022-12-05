# Maintainer: WeirdTreeThing <bradyn127@protonmail.com>
pkgname=cgpt-bin
pkgver=15054.B
pkgrel=1
_rel=R106
pkgdesc="GPT manipulation tool with support for Chromium OS extensions"
arch=('x86_64')
url="https://chromium.googlesource.com/chromiumos/platform/vboot_reference/"
license=('BSD')
depends=('glibc' 'libuuid.so')
provides=('cgpt')
source=("cgpt.deb::http://archive.ubuntu.com/ubuntu/pool/universe/v/vboot-utils/cgpt_0~${_rel}-${pkgver}-${pkgrel}_amd64.deb")
sha512sums=("ff372537370447671550ef442f76b70a330a202ad7497b35f54b010186445cc908188940ee0fcd2639bb44a1c2a2f8995fb4758fb6624f69875d1bdf14d6feb7")

package() {
	cd "$srcdir"
	bsdtar -x -f data.tar.zst -C "$pkgdir"
	cd "$pkgdir"
	install -Dm644 ./usr/share/doc/cgpt/copyright "$pkgdir"/usr/share/licenses/cgpt/COPYRIGHT
	rm -r ./usr/share/doc
}
