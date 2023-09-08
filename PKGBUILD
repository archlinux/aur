# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230904.0
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
sha512sums_x86_64=('af3dbb48d8c1476e648ee700228b4cbfb5fbdd8f1dac9e36881f949d2b84559d588c192f5e54e314bb240acc15b3df054ce03f92f4fecf33f2a6f45a9abe5d1e'
                   '677dbe314190855c807c9ec7cbaed721812d21a8cf042218da1440df6af60d9554bf45f295cf9753cff2ad30a5ef439f215da38e036718619c1b5a5019ffe623')
sha512sums_aarch64=('0c9cda69b8b765877ec6202ea082dc31afe87ff28714e8dc127114a41dbbee0d5a477ac65b58ed171de3658ccd7de5606295694a654172bb75c07f3bb8dca62c'
                    '2cc0a33518f3dcb1b341e1a04f821955c96615fcf68583fbd591b51618ace63cadc846efac67cd11b50d44455a2de59df37a2ca5a1afc513bd07aa9a2838b66a')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
