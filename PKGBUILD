pkgname=git-fmt-diff
pkgver=1.0.3
pkgrel=1
pkgdesc="Git integration with any code formatter"
arch=('any')
depends=(git posix)
optdepends=(
  'vim: automatic filetype detection'
)
url="https://codeberg.org/Jorenar/${pkgname}"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Jorenar/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fd7dc11b4c7100e71d5862d4522c8fac5078e5c0e4a853e4ad6b7fdb28de5b75')

package() {
    cd "$srcdir"/"$pkgname-$pkgver"

    bin="$pkgdir"/usr/bin
    mkdir -p "$bin"
    install -Dm755 "$pkgname" "$bin"/"$pkgname"

    completions="$pkgdir"/usr/share/bash-completion/completions/
    mkdir -p "$completions"
    install -Dm644 "completion.bash" "$completions"/"$pkgname"

    licenses="$pkgdir"/usr/share/licenses/"$pkgname"
    mkdir -p "$licenses"
    install -Dm644 "LICENSE" "$licenses"/LICENSE
}
