# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240916.0
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
sha512sums_x86_64=('d229a0df493c358182b827b2751ee0cdd46d9b486fa410639e5c18dc4de38f18e6fae823c2a868354929ffc494014406fe42543b6180b2859d07d7706a2ced6d'
                   '59db8a4648abae2b55cab3e3653eb7a3bca187b72d241903b639209e8f21e96f3a9132b4d7ae5d048b2fa488fb331bdb6cb185c385eeedbebc674e0946e44330')
sha512sums_aarch64=('6931f8e09804c8042fc755c88b8957af3cf5c3ebf5cec3d3d9c11229bcaf4123ac10acb84e75dfaa22b25132e7a8c0c3fd25af4b1e255662907249ba1e42a284'
                    'a0c22cdb8dda985c82022503be3b69164bdc4d8a706f6819e969895bc9162e96ad88cb8e9531e88552843a0271964d03fc141ddcd4f3c765b344afdfe77330fb')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
