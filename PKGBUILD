# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-bin
pkgver=26.2.2
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface (binaries for latest stable version)"
arch=('x86_64' 'aarch64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source_x86_64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('20971dfce60936841fd8b8d860840f6ccf7c727c2b809aaad1bf0f7d1b7fc03f')
sha256sums_aarch64=('8dde463bc7522d8a98bb34d4e9120de73a2bae0dae2f3f6f7f7b204630e5f938')

package() {
    tar -C "$pkgdir" -xvf chdig-$pkgver-1-$(uname -m).pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
