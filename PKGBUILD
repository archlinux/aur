# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230417.0
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
sha512sums_x86_64=('2659be1cabe84ab2d6e8e72f1c94ad268b2214dd03a18ec67b57c39297d1a722c9f4b6ae5f098ef6941b967856fdd37ffcecda1a06405e4bad5307081091fa8a'
                   '40019143a01980cca9d4ebbbef85892aed344567d9b1b302c32cc8f31d380b9abe07b7ca0a3fb4f60ce9950f6d2346db635b3b45f2d2034a48831da0fd0a107d')
sha512sums_aarch64=('371ffc60854e0177980268e6140a6ce621ee665e8400e369a1bd558f1fc4963c30a58a9c467ec3ba6b424f57aa76bba5ed598762813a394a032ac84d950ce359'
                    '1829a9bfd6c90e6343c506625eeed9f54c2144472d3f64f4ecd9ab3c24d5087505d3ca36aa20d75c1c4c9ddf247641e5646bc08df518b1b5dd221068c29e5463')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
