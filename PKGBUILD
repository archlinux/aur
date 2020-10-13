# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=rofi-gh
pkgver=0.1.1
pkgrel=1
pkgdesc='GitHub issues in rofi'
url='https://github.com/OJFord/rofi-gh'
license=('BSD-3')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('f03e1af1b5f6919ff17ad47edf670f3c')
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

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/bin"

    # shellcheck disable=SC2043
    for s in issues; do
        install -D -m755 "./$pkgname-$s" "$pkgdir/usr/bin/$pkgname-$s"
    done
}
