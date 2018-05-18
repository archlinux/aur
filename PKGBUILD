# Maintainer: Marcin Mielniczuk <marmistrz@inboxalias.com>

pkgname=abuild
pkgver=3.2.0_rc1
pkgrel=1
pkgdesc="Build script to build Alpine packages"
arch=('i686' 'x86_64')
url="https://alpinelinux.org"
license=('GPL2')
makedepends=('git')
source=("git+https://git.alpinelinux.org/cgit/abuild#tag=v${pkgver}")
sha1sums=("SKIP")
build() {
    cd "${srcdir}/${pkgname}"
    sed -i "s_/bin/ash_/bin/bash_g" abuild.in
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR="$pkgdir"
}

