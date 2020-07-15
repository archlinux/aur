# Maintainer: Samuel Čavoj <sammko@sammserver.com>
pkgname=ctop-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Top-like interface for container metrics"
depends=('glibc')
provides=('ctop')
conflicts=('ctop')
arch=('x86_64' 'aarch64' 'armv7h')
url="https://bcicen.github.io/ctop/"
_url="https://github.com/bcicen/ctop/releases/download/"
license=('MIT')
source_x86_64=("ctop-${pkgver}-linux-x86_64::${_url}v${pkgver}/ctop-${pkgver}-linux-amd64")
source_aarch64=("ctop-${pkgver}-linux-aarch64::${_url}v${pkgver}/ctop-${pkgver}-linux-arm64")
source_armv7h=("ctop-${pkgver}-linux-armv7h::${_url}v${pkgver}/ctop-${pkgver}-linux-arm")
source=("LICENSE")
sha256sums=('dddd1fa1661d597b20142203d85c29c01cf18d400be06db289b26d578f81c553')
sha256sums_x86_64=('54598d424396cbe25646e097b47d76a55d475c29ae4c3111548141a3ecfb7fc1')
sha256sums_aarch64=('dc2010472511e8764a8495ef20bab40dd2f695076b0fe5d8811ee8acb02a0a74')
sha256sums_armv7h=('b25714de75efb7b0975e34267d9b345e6ea229629b4ff05912ccb003cbe01f2f')

package() {
	install -Dm755 "$srcdir/ctop-$pkgver-linux-$CARCH" "$pkgdir/usr/bin/ctop"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
