# Maintainer: xxyangyoulin <xxyangyoulin@gmail.com>
pkgname=hyptg-git
pkgver=1.0.0.1.gd58a4c2  # 初始版本号，可根据需要更新
pkgrel=1
pkgdesc="Intelligently switch floating windows to prevent overlapping floats and return to the previous tiled window workflow"
arch=('any')
url="https://github.com/xxyangyoulin/hyptg"
license=('AGPL-3.0')
provides=('hyptg')
depends=(
    jq
    bash
    hyprland
)
makedepends=(
    git
)
source=("git+https://github.com/xxyangyoulin/hyptg.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hyptg" || exit 1
    printf "%s" "$(git describe --tags --long | sed 's/^v//;s/-/./g')"
}

package() {
    cd "$srcdir/hyptg" || exit 1
    install -Dm755 "hyptg" "$pkgdir/usr/bin/hyptg"
}

