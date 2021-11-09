# Maintainer: Christoph Brill <aur@christophbrill.de>
pkgname=driftwood
pkgver=1.0.0
pkgrel=1
pkgdesc="lookup whether a private key is used for things like TLS or as a GitHub SSH key"
arch=('i686' 'x86_64')
url="https://github.com/trufflesecurity/driftwood"
license=('Apache')
depends=()
optdepends=()
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trufflesecurity/driftwood/archive/v${pkgver}.tar.gz")
sha256sums=('0de16944692454c9ff82bc1f3b74f24be94737fa0f21f4546ac31a3ecfb85a11')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  go build
  mkdir "$pkgdir"/usr/bin -p
  cp ${pkgname} "$pkgdir"/usr/bin
}
