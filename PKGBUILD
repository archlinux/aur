# Maintainer: Phillip MacNaughton <wisheralpha@gmail.com>
pkgname='proton-shim'
pkgver='1.0.1'
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
sha256sums=('11f723030cb9179349c955e945ec04f29ad30f2768deb077802c94f3aba79992')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 proton-shim.sh "$pkgdir/usr/bin/proton-shim"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 proton-shim.1 "$pkgdir/usr/share/man/man1/proton-shim.1"
}