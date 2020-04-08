# Maintainer: baraclese at gmail dot com
pkgname=binmerge-git
pkgver=r17.5d32365
pkgrel=1
pkgdesc="Tool to merge multiple bin/cue tracks into one."
url="https://github.com/putnam/binmerge"
arch=('any')
license=('GPL2')
depends=(
    python
    python-argparse
)
source=("git+https://github.com/putnam/binmerge")
sha256sums=('SKIP')

pkgver() {
    cd binmerge
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd binmerge
    install -Dm 755 binmerge "$pkgdir/usr/bin/binmerge"
}
