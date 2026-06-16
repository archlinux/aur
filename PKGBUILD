# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-bin
pkgver=26.6.1
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface (binaries for latest stable version)"
arch=('x86_64' 'aarch64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source_x86_64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('1b9dd25eb4d52c1d37458b9c74b5081cf1962132d90ea7447a4aebb9e750f0ab')
sha256sums_aarch64=('fd2a1c60068bbb2ed9be5c0adf14ababc609de7026914ed1a92cd963f3864e5e')

package() {
    tar -C "$pkgdir" -xvf chdig-$pkgver-1-$(uname -m).pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
