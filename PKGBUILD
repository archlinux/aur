# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=rofi-gh
pkgver=0.1.0
pkgrel=2
pkgdesc='GitHub issues in rofi'
url='https://github.com/OJFord/rofi-gh'
license=('BSD-3')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('b71d7604e1c65af5e8bc90f3df2727e5')
arch=('any')
depends=(
    'github-cli'
    'rofi'
)
provides=(
    rofi-gh-issues
)

package() {
    set -eu
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin"

    # shellcheck disable=SC2043
    for s in issues; do
        install -D -m755 "./$pkgname-$s" "$pkgdir/usr/bin/$pkgname-$s"
    done
}
