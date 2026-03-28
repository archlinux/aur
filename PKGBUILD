# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-bin
pkgver=26.3.1
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface (binaries for latest stable version)"
arch=('x86_64' 'aarch64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source_x86_64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('2d8e9773cb9624f75ee22ce6c04db5693a33d32a4e74281f1ba760eedc91f8bb')
sha256sums_aarch64=('4453e118d4eb19168fc3c53f4b4b3768c3703b99442b82a4ad8d04626dcba1e7')

package() {
    tar -C "$pkgdir" -xvf chdig-$pkgver-1-$(uname -m).pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
