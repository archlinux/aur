# Maintainer: Phillip MacNaughton <wisheralpha@gmail.com>
pkgname='proton-shim'
pkgver='2.5.0'
pkgrel=1
epoch=
pkgdesc="Easily run programs and scripts inside Steam game prefixes"
arch=('any')
url="https://gitlab.com/Wisher/ProtonShim"
license=('MIT')
depends=('bash' 'findutils' 'grep' 'coreutils' 'file' 'sed' 'sudo' 'steam')
groups=()
makedepends=()
checkdepends=()
optdepends=(
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
sha256sums=('2516aa4e2f9de16e4424381afdfdd68a8a35f314a19f9d6e6b67fe3b4e64abf2')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 proton-shim.sh "$pkgdir/usr/bin/proton-shim"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 proton-shim.1 "$pkgdir/usr/share/man/man1/proton-shim.1"
}