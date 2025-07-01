# Maintainer: Phillip MacNaughton <wisheralpha@gmail.com>
pkgname='proton-shim'
pkgver='2.4.1'
pkgrel=1
epoch=
pkgdesc="Easily run programs and scripts inside Steam game prefixes"
arch=('any')
url="https://gitlab.com/Wisher/ProtonShim"
license=('MIT')
depends=('bash')
groups=()
makedepends=()
checkdepends=()
optdepends=(
    'steam: required for default proton installations' 
    'proton-ge-custom-bin: optional proton variant support'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(
    "$pkgname-$pkgver.tar.gz::https://gitlab.com/api/v4/projects/71058782/packages/generic/release/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('9e2c21f6a3b42bcc6f34afe1dbf13a53fa1308abee3baba30ae5419e2365f69c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 proton-shim.sh "$pkgdir/usr/bin/proton-shim"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 proton-shim.1 "$pkgdir/usr/share/man/man1/proton-shim.1"
}