# Maintainer: Artemy Sudakov <finziyr@yandex.ru>
pkgname=cgpt-bin
pkgver=13597.B
pkgrel=1
_rel=R88
pkgdesc="GPT manipulation tool with support for Chromium OS extensions"
arch=('x86_64')
url="https://chromium.googlesource.com/chromiumos/platform/vboot_reference/"
license=('BSD')
depends=('glibc' 'libuuid.so')
provides=('cgpt')
source=("cgpt.deb::http://archive.ubuntu.com/ubuntu/pool/universe/v/vboot-utils/cgpt_0~${_rel}-${pkgver}-${pkgrel}_amd64.deb")
sha512sums=("30db4b646fe55a296afde8bfb9fa02939fbfa401c13e27302ffa51f7e40bd22bea4037a7014f606cbc5046cd9eaace63827078775c7d040e34d5b27ebe69b0f6")

package() {
	cd "$srcdir"
	bsdtar -x -f data.tar.xz -C "$pkgdir"
	cd "$pkgdir"
	install -Dm644 ./usr/share/doc/cgpt/copyright "$pkgdir"/usr/share/licenses/cgpt/COPYRIGHT
	rm -r ./usr/share/doc
}
