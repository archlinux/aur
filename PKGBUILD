# Maintainer: S7VN-DEV <root@s7vn-dev.ca>

pkgname=rendercv-bin
_pkgname=rendercv
pkgdesc="Binary version of renderCV. A CV/resume generator for academics and engineers, YAML to PDF"
pkgver=2.7
pkgrel=1
arch=('x86_64')
url="https://github.com/rendercv/rendercv/"
license=('MIT')

provides=('rendercv')
conflicts=('rendercv')
makedepends=('unzip')

depends=('glibc')

sha256sums=(
	'ce498c6a2f55ed42c635065bc537e6e38f258a690760b9a2290e58248767e7ee'
	'9b7a082e203987b6df516af8b055e8ccaacbdf5522724e5e82a62f07ccc0b812'
)

options=(
	'!strip'
	'!emptydirs'
)
source=(
  "rendercv-linux-x86_64.zip::https://github.com/rendercv/rendercv/releases/download/v${pkgver}/rendercv-linux-x86_64.zip"
  "LICENSE::https://raw.githubusercontent.com/rendercv/rendercv/main/LICENSE"
)

package() {
  install -Dm755 "${srcdir}/rendercv-linux-x86_64" \
  	"$pkgdir/usr/bin/rendercv"
  	
  install -Dm644 "${srcdir}/LICENSE" \
  	"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
