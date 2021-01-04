# Maintainer: Samuel Čavoj <sammko@sammserver.com>
pkgname=ctop-bin
pkgver=0.7.5
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
sha256sums_x86_64=('e2949316cdfe360374b76d45ea512f603b42c0db693a70a6a4c11624aa200b8c')
sha256sums_aarch64=('14053f778e4cb3dd9aa84edee722488cd0b2baa4b0ca499465b84abfbff00dac')
sha256sums_armv7h=('4a554fecf23b5bb4f621a727facd81fa12ba49a1059f701d606175df2aa3aac6')

package() {
	install -Dm755 "$srcdir/ctop-$pkgver-linux-$CARCH" "$pkgdir/usr/bin/ctop"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
