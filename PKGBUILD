# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20220606.0
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
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/x86_64/$_pkgbin"
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/x86_64/$_pkgshim"
)
source_aarch64=(
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/aarch64/$_pkgbin"
	"https://storage.googleapis.com/${pkgname%-bin}/releases/release/${pkgver%.[0-9]}/aarch64/$_pkgshim"
)
sha512sums_x86_64=(
	'26c614e815a6c42666931fd67d3bbed3520ac1643917fe04989a1e775a708f82f6d5118dafb1cc2435b243bde9b980b8a8ddada22a067cae55d1e6447c1a54d0'
	'3f0297cf2f0d31b83590463616e202a2115c3ad5aa56c767511fa8f13ba594927738704405ffed2d1e836e70b75f5aad7e667fc54575dcace00c8ea52bde279b'
)
sha512sums_aarch64=(
	'66e44c009f91ce7910593283270df57c6e9c7614fd23296125351a83ae288838e3fc86da741e3b0ec5343f3611e68e6ddbe1898be504febf59aa4780373f78a2'
	'ccc9c7c469f12784b55a99ff1278104484605f76a5e3559a05344b480d91f556baf4d2a2ad370b0ef2b8ac85b20a582a8c9e0e1b99e6225c3f23e12af68cc277'
)

package() {
	install -Dm 755 "$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim" "$pkgdir/usr/bin/$_pkgshim"
}
