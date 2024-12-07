# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20241202.0
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
sha512sums_x86_64=('f084c92f1fdd24d8685ed0bc3e255bdb867790dc3144720f58532b9a94071b50af795e163483d9f0630d4df009b2ec1d55c7d948651deca607eae671680954ad'
                   '75468d59e64963f9613dd65d89e0c2ff396e01e4ba5e4cd62f86baca07c42d5eedba69f720aad107d030d7498a31510dd007d4dd459f46bba9cbec6d38a95a34')
sha512sums_aarch64=('8e9169cc221a666da6521877ffd5ba0259f4047d76b18d13c677d08c33491e937775beea702248b5fcd084560c2053f9363dce00f1245db329545f2a63d256c0'
                    'e5d6ab0906460b1fc8b0339e054c8dd64e3d7d38511fd0e153e3ad5d3c2b5b8a08b9fe24f4045a1fc1a7b56521ec49b3269be69f6ed3ee6f9e6a98f2d7a0b401')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
