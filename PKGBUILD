# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-latest-bin
pkgver=25.6.1.1
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface (compiled binaries for upstream)"
arch=('x86_64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source=(
    "https://github.com/azat/chdig/releases/download/latest/chdig-latest-x86_64.pkg.tar.zst"
)
sha256sums=(
    'SKIP'
)

# Rewrite version from latest to the real one
pkgver() {
    tar -xf chdig-latest-x86_64.pkg.tar.zst -O .PKGINFO | awk '/pkgver/ { print $NF }' | sed -e 's/-/./g'
}

package() {
    tar -C "$pkgdir" -xvf chdig-latest-x86_64.pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
