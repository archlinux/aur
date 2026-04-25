# SPDX-License-Identifier: MIT
# Maintainer: Sagar Patil <fntneerqqlcngvy@tznvy.pbz>

pkgname=triforce
pkgver=0.3.2
pkgrel=1
pkgdesc="Triforce LV2 Plugin"
url="https://github.com/chadmed/triforce"

arch=('x86_64')
license=('MIT')
makedepends=('cargo')
depends=('lv2' 'git')

_gitroot="https://github.com/chadmed/triforce"
_gitname="${pkgname}-${pkgver}"
source=("${_gitname}::git+${_gitroot}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
    make DESTDIR="${pkgdir}" LIBDIR="/usr/lib" install
}
