# Maintainer: S7VN-DEV <root@s7vn-dev.ca>

pkgname=rendercv-bin
_pkgname=rendercv
pkgdesc="Binary version of renderCV. A CV/resume generator for academics and engineers, YAML to PDF"
pkgver=2.6
pkgrel=1
arch=('x86_64')
url="https://github.com/rendercv/rendercv/"
license=('MIT')

provides=('rendercv')
conflicts=('rendercv')
makedepends=('unzip')

depends=('glibc')

sha256sums=(
	'be1254f82696f94b08c6678eb1a5b88dff9594f367e613037c6a23a3741974ad'
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
