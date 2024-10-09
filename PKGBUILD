# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20241007.0
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
sha512sums_x86_64=('4c14a5a1d41ed505376feba6ab90dd0cff8444eb1a0b8c735febec818b84e5bb33b4e7c9b800a0bbc0d75acc73e1b97455e1319a12cff60e0a40b0db3a8b5f12'
                   'b7cb0ab08ad91689e2b2c8a1afe8b457d7d7af3692d002c24c23e9ddbfa1fcfc62c1a81386c4bf15ae58b0c514447104b1c7b83a57133de62b1c10e3f9c8e73c')
sha512sums_aarch64=('e3807ab44a473c9c856503d97850023c84c174b375e37ed66ea0c791789ff17805c6496b64194fa3564614f7c27e2f90ce38d0bb7de794edce280b5f2550dc2d'
                    'cd7d19c16a15877c18ddab638db22452f2e58c02077116773338f84acd57bf8fe2d9d4401ae35e3cdcb1301a61e560c5793320754fb53645bbbaeea4944936bd')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
