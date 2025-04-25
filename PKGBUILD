# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-bin
_gitname=kuzu
pkgver=v0.9.0
pkgrel=1
epoch=
pkgdesc="In-process property graph database management system (GDBMS) built for query speed and scalability"
arch=('x86_64')
url="https://kuzudb.com"
license=('MIT')
groups=()
depends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuzudb/kuzu/releases/download/${pkgver}/kuzu_cli-linux-x86_64.tar.gz"
        "lib${pkgname}-${pkgver}.tar.gz::https://github.com/kuzudb/kuzu/releases/download/${pkgver}/libkuzu-linux-x86_64.tar.gz")
sha256sums=('f90825163863455fde4e03aee4ba6c72c756e34d975969bd164cef0c486c2faf'
            '27854591e655363a195538c1dcba0e2a8f9ad4b46e3d5d70836d546d38139ba4')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname} "$pkgdir/usr/bin"
  cp ${srcdir}/libkuzu.so "$pkgdir/usr/lib"
  cp ${srcdir}/kuzu.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
