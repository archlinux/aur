# Maintainer: Jorengarenar

pkgname=git-fmt-diff
pkgver=0.1.2
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
sha256sums=('296eed913bcdbf8f4fc67cf84c70e5c8b3dff96a9b7d253381040569e237fc0b')

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
