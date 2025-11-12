# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-bin
pkgver=25.11.1
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface (binaries for latest stable version)"
arch=('x86_64' 'aarch64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source_x86_64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('a5fef0053a945dd61ee826b4c1b641b550a9e1154c9116916bffd34b93cb36b5')
sha256sums_aarch64=('7ed8dc0672f5397ca4e0836cc856eb3a6ee93b7b5927856da8294df6e9cd3b97')

package() {
    tar -C "$pkgdir" -xvf chdig-$pkgver-1-$(uname -m).pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
