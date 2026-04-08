# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20260406.0
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
sha512sums_x86_64=('daabda0cf22b1f7f7e0c587b625d684cceb6777e08f99d8010d4bc9bbe99a8396cd0590ecd67084f6cbaa05869c2a44249ec40ce6f8262a7010dec5d1df90b39'
                   '2a7c5b2465ab533837710529e9ba5c84a70df5b06d1e782ecf33408b678cf442cae4d600a93e0a9b4d0bf9be3cc64c781b760c3bb29cbee703d6769ef6df7181')
sha512sums_aarch64=('b2a0bf0096bcff15bcfe097bd16c8c00491578d1dd69309effa3aa3584eab5143b721f79522c217cd76b6c5337eaac7385eb0c6da3413826df228b54a4f02303'
                    'abd41610cf09e2dbcc2095cc54c2c27047c4b99271d75936475014bb5dd04d24bc5daa912498c91ad86d5e745b4c80b8c7c9feba770a8611d823d7387ba29483')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
