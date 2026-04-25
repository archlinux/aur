# Maintainer: Cynthia Rey <cynthia@cynthia.dev>
pkgname=vmaware-bin
pkgver=2.7.0
pkgrel=1
pkgdesc='Advanced VM detection library and tool'
url='https://github.com/kernelwernel/VMAware'
arch=('x86_64')
depends=(
	glibc
	libgcc
	libstdc++
)
conflicts=('vmaware')
provides=('vmaware')
license=('MIT')

source=(
	"https://github.com/kernelwernel/VMAware/releases/download/v$pkgver/vmaware.hpp"
	"https://github.com/kernelwernel/VMAware/releases/download/v$pkgver/vmaware_linux"
	"LICENSE.$pkgname::https://raw.githubusercontent.com/kernelwernel/VMAware/refs/tags/v$pkgver/LICENSE"
)

b2sums=('645af3e05f89dd8b142cb5e459321dee78684efc019df061ed9fbc76f5e8106d6a54b991b252f91dea656bfa94b698d8155b63eb602f48a348a31e3c347dcf14'
        '869e7108e51010a5fdfedb45b7dd6ca8499996072f51f6f4a956dab72b414848810204448034a94221446ac1541572c4c25b88bb5160a84c08b51ae9640b2a22'
        '24807598a96a78511ec39fb08153bfb9be7d4747963733a0f02fcbf717f1ddf1f67cdee30fd79c0a10973b89c530410b39445afa35a4eb415bccd69a1370d22b')

package() {
	install -Dm755 "vmaware_linux" "$pkgdir/usr/bin/vmaware"
	install -Dm644 "vmaware.hpp" "$pkgdir/usr/include/vmaware.hpp"
	install -Dm644 "LICENSE.$pkgname" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
