# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-bin
_gitname=kuzu
pkgver=v0.10.0
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
sha256sums=('1d38995bb1503e9d8372cfe98ec3bbe3f77029d838c4f01d320ecd11df368cd4'
            '898ab5639b21a891a56e5962108679dce5deeed06db9559a9a0974e386ee7640')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname} "$pkgdir/usr/bin"
  cp ${srcdir}/libkuzu.so "$pkgdir/usr/lib"
  cp ${srcdir}/kuzu.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
