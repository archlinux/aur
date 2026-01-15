# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-bin
pkgver=26.1.1
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface (binaries for latest stable version)"
arch=('x86_64' 'aarch64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source_x86_64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('c3f40f842c393727d1d560234e5d8defe2f5e119e1d5e92b63c6601ef3571bd4')
sha256sums_aarch64=('9bdb848cc4aea6cbebbad8e4116e31c241be47d5273e47c485966084a94cdb0e')

package() {
    tar -C "$pkgdir" -xvf chdig-$pkgver-1-$(uname -m).pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
