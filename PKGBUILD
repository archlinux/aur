# Maintainer: Jorengarenar

pkgname=git-fmt-diff
pkgver=0.1.3
pkgrel=1
pkgdesc="Git integration with any code formatter"
arch=('any')
depends=(git posix)
optdepends=(
  'vim: automatic filetype detection'
)
url="https://github.com/Jorengarenar/${pkgname}"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Jorengarenar/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('57b50d3812e3eb3e6ee5d58e6625415309ad8798a19c27c26babd2cf433070d1')

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
