# Maintainer: Jorengarenar

pkgname=git-fmt-diff
pkgver=0.1.0
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
sha256sums=('0de3d88e9d5c5a4b19db0a4e5788eaa9e0b2e5b96e25d6f94439ad08bd9cdf52')

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
