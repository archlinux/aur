# shellcheck shell=bash disable=SC2034,SC2154,SC2164
# Maintainer: lucasm < luluco250 at gmail dot com >

_basename=fallout2-ce
pkgname=$_basename-bin
pkgver=1.3.0
pkgrel=2
pkgdesc='Fallout 2 for modern operating systems'
arch=('x86_64' 'i686')
url="https://github.com/alexbatalov/$_basename"
license=('custom:SUL')
depends=('sdl2')
options=('!debug')
source=(
    "LICENSE-${pkgver}.md::$url/raw/refs/tags/v$pkgver/LICENSE.md"
)
sha256sums=(
    '3c260f537a0c7c3d140e5524551e5743c836cca8d819216a6934aa4669d9abec'
)
source_x86_64=(
    "${_basename}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/$_basename-linux-x64.tar.gz"
)
sha256sums_x86_64=(
    '6d7fcd57e07bdb135538179b89c28bf386d24408b2f03e67048bd6ed527a0899'
)
source_i686=(
    "${_basename}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/$_basename-linux-x86.tar.gz"
)
sha256sums_i686=(
    '0be281bd307d663bb07b38e863fb805a3f0b86ab88d427af625b93d0bfebfdd4'
)

package() {
    install -Dm755 "$srcdir/$_basename" "$pkgdir/usr/bin/$_basename"
    install -Dm644 LICENSE-${pkgver}.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

