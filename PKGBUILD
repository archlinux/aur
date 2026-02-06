# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260202.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache-2.0')
optdepends=('docker: for Docker runtime support')
provides=(
	"${pkgname%-bin}"
)
conflicts=(
	"${pkgname%-bin}"
)
source_x86_64=(
	"$_pkgbin-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgbin"
	"$_pkgshim-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgshim"
)
source_aarch64=(
	"$_pkgbin-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgbin"
	"$_pkgshim-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgshim"
)
sha512sums_x86_64=('f7bb9cc5e3f5e36a6788f959361415f6d7f7cd0225b8b4d99728da4b1ac7e5c7ce9c72b4c61e424ba93db77c983109d56b54907a3b2e2b982b34058410611023'
                   'bd21b80502be25484d8b43168c88d66b6f3e853c78c0ae5b5206c5625e2a365e98c8b3ba259453d18c01d1aa08fb7c8c1e7f122fdcd7ef806bfc2f44f5837b5e')
sha512sums_aarch64=('5fbb9c68efdf3a404217fb57be55051b4b5f8b83ca631101204615b87ff5b6ea8680cd6599e434f1d87fecb9071367b65e90cd8ad5df3f0b9f0101796ecc8c43'
                    '714ad3a53a28aa4acd891553d848278f5a873d0a1733836382eaf2bf701d62ece9cef324390602d2676af5e2e3a3d329486d2b18803c9cef5685220764757eb4')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
