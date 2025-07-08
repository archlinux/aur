# Maintainer: Phillip MacNaughton <wisheralpha@gmail.com>
pkgname='proton-shim'
pkgver='2.7.3'
pkgrel=1
epoch=
pkgdesc="Easily run programs and scripts inside Steam game prefixes"
arch=('any')
url="https://gitlab.com/Wisher/ProtonShim"
license=('MIT')
depends=('bash' 'findutils' 'grep' 'coreutils' 'file' 'sed' 'sudo')
groups=()
makedepends=()
checkdepends=()
optdepends=(
    'steam: (required) a steam installation is required, be it a package, flatpak, or otherwise'
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
sha256sums=('239f6bbef97bc8878c051939428778d75b8dd571dd6ad61cd999e33b1f712737')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 proton-shim.sh "$pkgdir/usr/bin/proton-shim"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 proton-shim.1 "$pkgdir/usr/share/man/man1/proton-shim.1"
}