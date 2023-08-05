# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230801.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache')
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
sha512sums_x86_64=('97346171e61ba253a00646ca5b9a49156181e069c7db6f48abc6ef621b5b5970a2917ba21e797b5906a11f5d5fc31ab60b9238f0a4d98d404e5d19b1b5ec0e9c'
                   '58aa688e3a98d81b86f1f739b29a8d6598bb3f7007a35a90303996e86883a77c8ab56a49534f246bdf37db82025911a3f38fcd9fd73b2c1e78f966e777bdc1be')
sha512sums_aarch64=('c3115c0bdb8f2acd97df6c2484a30c131af7220d988c7c4ca3cae759194ba0a18ecf3d756a59a18c7bd2dec8e57f7cbc467132ed74211c08d34e8712d48b9c43'
                    'c0fe327a21013466f8e0fa763a32381f98f8191c6368be9862b5685e1b1c8a284eb6f44abc22c5e38e2e55de9a2df0bdc79708844ad90ef19d30b718a056bf58')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
