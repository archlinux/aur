# Maintainer: Samuel Čavoj <sammko@sammserver.com>
pkgname=ctop-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="Top-like interface for container metrics"
depends=('glibc')
provides=('ctop')
conflicts=('ctop')
arch=('x86_64' 'aarch64' 'armv7h')
url="https://bcicen.github.io/ctop/"
_url="https://github.com/bcicen/ctop/releases/download/"
license=('MIT')
source_x86_64=("ctop-${pkgver}-linux-x86_64::${_url}${pkgver}/ctop-${pkgver}-linux-amd64")
source_aarch64=("ctop-${pkgver}-linux-aarch64::${_url}${pkgver}/ctop-${pkgver}-linux-arm64")
source_armv7h=("ctop-${pkgver}-linux-armv7h::${_url}${pkgver}/ctop-${pkgver}-linux-arm")
source=("LICENSE")
sha256sums=('dddd1fa1661d597b20142203d85c29c01cf18d400be06db289b26d578f81c553')
sha256sums_x86_64=('c5f8da250ec733084fb3891f2f8d04a49ffd25e81af59079216f2e6bb35fd983')
sha256sums_aarch64=('2556814ec2e24921e5285b3b153c6efc9060069da951b60cd1e6dc1769ce44a3')
sha256sums_armv7h=('15541fdcb10953a2f93d22c9e9beb31d07cd06c0c529639c0f9430504ea870a5')

package() {
	install -Dm755 "$srcdir/ctop-$pkgver-linux-$CARCH" "$pkgdir/usr/bin/ctop"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
