# Maintainer: Mobin Aydinfar <mobin at mobintestserver dot ir>

pkgname=libdinitctl
pkgver=0_git20250206
_gitver='a3111b9b7fa4174518f2b696e67e1ef664e16589'
pkgrel=2
pkgdesc="Library to interact with dinit's client protocol"
url='https://github.com/chimera-linux/libdinitctl'
arch=('x86_64')
license=('BSD-2-Clause')
makedepends=('meson' 'pkgconf')
source=(libdinitctl.tar.gz::"$url/archive/$_gitver.tar.gz")
sha256sums=('9b9b50404a8835dc6c8000c41a093cdcd83c784690275f5b3872ec991faeeacc')

build() {
    arch-meson "libdinitctl-$_gitver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}

