# Maintainer: Ryan Yuan <ryanyuanzhehan@gmail.com>
# Contributor: 漓翎_cub
pkgname=hei-cursors-git
pkgver=0.r1.g0000000
pkgrel=4
pkgdesc="Hei Cursor Theme. Created by Bilibili user 1013625945 (漓翎_cub), ported by GitHub user Tseshongfeeshur (Ryan)."
arch=('any')
url="https://github.com/Tseshongfeeshur/hei-cursors"
license=('MIT')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hei-cursors"
    local commits=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    echo "1.0.r${commits}.g${hash}"
}

package() {
    cd "$srcdir/hei-cursors"

    install -dm755 "$pkgdir/usr/share/icons/hei_cursors"
    cp -r * "$pkgdir/usr/share/icons/hei_cursors/"
}
