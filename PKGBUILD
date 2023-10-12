# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20231009.0
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
sha512sums_x86_64=('a641723d442991cca50fd55b5e1e5c53e1efcad2ae4634ca1e2425ef33cc04515c88b4c43e7e1e0fb4cd61fdc285f08dd914e0ab9271cdcc921807d760b02543'
                   'fffd6e03bd5aa2481300c3b9cecb02c1c6b64d97560ca12aa19fd886243e84ece370370ac960d6c849a258d47be399c94f7b5ba2b8fcad6787eabc86b0bfba94')
sha512sums_aarch64=('26e2e9750c05f9919e4e150f6ce2f4e9536444bed6817cc5bb6cdfda374cd123e3f82b30f5c1b55b0b71ddfaffbf150c2fdc3aabecc55a0ed226fdda3f05d8de'
                    'd6eec33d5ba7f557f19f9499ade502d510cb4e4d9d3525a677fc1942403a984c343be5ecb64f2904823d478e626027b3aea69c9e641240cac3c2c8c9e8feaa00')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
